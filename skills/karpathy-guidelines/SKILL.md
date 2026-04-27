---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.
license: MIT
---

# Karpathy Guidelines

Behavioral guidelines to reduce common LLM coding mistakes, derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## Activation Workflow

When this skill is loaded in a project:

1. Check whether the current agent's project rules file already contains these guidelines.
   - Codex: `AGENTS.md`
   - Claude Code: `CLAUDE.md`
   - Gemini CLI: `GEMINI.md`
   - Cursor: `.cursor/rules/karpathy-guidelines.mdc`
2. Treat the guidelines as already present if the file contains `karpathy-guidelines:start`, `# Karpathy Guidelines`, or the four principle headings from this skill.
3. If the guidelines are already present, do not ask about installation. Apply the guidelines for the current task.
4. If the guidelines are not present, ask exactly once before continuing:

   "I can use the Karpathy guidelines for this session only, or add them to your agent rules file so future sessions use them too. Which do you want?"

5. If the user chooses session-only, apply the guidelines for this session and do not edit files.
6. If the user chooses to update the rules file, add the guidelines to the relevant file, preserving existing project instructions and wrapping the inserted block with:
   - `<!-- karpathy-guidelines:start -->`
   - `<!-- karpathy-guidelines:end -->`

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.
