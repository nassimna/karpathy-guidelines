#!/usr/bin/env bash
set -euo pipefail

script_path="$(readlink -f "${BASH_SOURCE[0]}")"
repo_dir="$(cd "$(dirname "$script_path")" && pwd)"
target_dir="${1:-$PWD}"

cursor_rule_file="$repo_dir/.cursor/rules/karpathy-guidelines.mdc"

marker_start="<!-- karpathy-guidelines:start -->"
marker_end="<!-- karpathy-guidelines:end -->"

usage() {
  cat <<'EOF'
Usage: ./install.sh [target-project-directory]

Installs the Karpathy behavioral guidelines into agent instruction files.
If no target directory is provided, the current working directory is used.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -d "$target_dir" ]]; then
  echo "Target directory does not exist: $target_dir" >&2
  exit 1
fi

install_markdown_file() {
  local destination="$1"
  local source="$2"
  local path="$target_dir/$destination"
  local tmp

  mkdir -p "$(dirname "$path")"
  tmp="$(mktemp)"

  {
    echo "$marker_start"
    cat "$source"
    echo
    echo "$marker_end"
  } > "$tmp"

  if [[ -f "$path" ]] && grep -q "$marker_start" "$path"; then
    awk -v start="$marker_start" -v end="$marker_end" '
      $0 == start { skip = 1; next }
      $0 == end { skip = 0; next }
      skip != 1 { print }
    ' "$path" > "$path.without-karpathy"
    {
      cat "$path.without-karpathy"
      [[ -s "$path.without-karpathy" ]] && echo
      cat "$tmp"
    } > "$path"
    rm "$path.without-karpathy"
    echo "Updated $destination"
  elif [[ -f "$path" ]]; then
    {
      cat "$path"
      echo
      cat "$tmp"
    } > "$path.with-karpathy"
    mv "$path.with-karpathy" "$path"
    echo "Appended to $destination"
  else
    mv "$tmp" "$path"
    tmp=""
    echo "Created $destination"
  fi

  if [[ -n "$tmp" && -f "$tmp" ]]; then
    rm "$tmp"
  fi
}

install_cursor_rule() {
  local destination=".cursor/rules/karpathy-guidelines.mdc"
  local path="$target_dir/$destination"

  mkdir -p "$(dirname "$path")"
  cp "$cursor_rule_file" "$path"
  echo "Created $destination"
}

show_menu() {
  cat <<'EOF'
Which agents should use these guidelines?

1) Claude Code  -> CLAUDE.md
2) Codex        -> AGENTS.md
3) Cursor       -> .cursor/rules/karpathy-guidelines.mdc
4) Gemini CLI   -> GEMINI.md
a) All

Enter choices separated by spaces, for example: 1 2
EOF
}

install_choice() {
  case "$1" in
    1|claude|Claude)
      install_markdown_file "CLAUDE.md" "$repo_dir/CLAUDE.md"
      ;;
    2|codex|Codex)
      install_markdown_file "AGENTS.md" "$repo_dir/AGENTS.md"
      ;;
    3|cursor|Cursor)
      install_cursor_rule
      ;;
    4|gemini|Gemini)
      install_markdown_file "GEMINI.md" "$repo_dir/GEMINI.md"
      ;;
    a|all|All)
      install_markdown_file "CLAUDE.md" "$repo_dir/CLAUDE.md"
      install_markdown_file "AGENTS.md" "$repo_dir/AGENTS.md"
      install_cursor_rule
      install_markdown_file "GEMINI.md" "$repo_dir/GEMINI.md"
      ;;
    *)
      echo "Unknown choice: $1" >&2
      return 1
      ;;
  esac
}

show_menu
read -r -p "> " choices

if [[ -z "${choices// }" ]]; then
  echo "No agents selected. Nothing changed."
  exit 0
fi

for choice in $choices; do
  install_choice "$choice"
done
