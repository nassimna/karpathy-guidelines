# Forms And Validation

## Rule

Use the project's existing form and validation approach. Do not introduce a new form or schema library just because it is familiar.

## Discovery

Before changing a form, inspect:

- Existing form components.
- Existing field wrapper, label, error, help-text, and submit patterns.
- Existing validation library or schema style.
- Existing server error mapping.
- Existing mutation/action handling.
- Existing accessibility patterns.

## Library Adaptation

- If the project uses Zod, Valibot, Yup, or another schema tool, follow it.
- If the project uses React Hook Form, Formik, VeeValidate, Angular forms, native forms, or framework actions, follow it.
- If the project uses shadcn form wrappers or custom design-system fields, reuse them.
- If validation is backend-first, keep client validation limited and mirror only useful constraints.

## Basics

- Use real form elements.
- Every input needs an accessible label.
- Do not use placeholder text as the only label.
- Show field-level errors near fields.
- Preserve user input after failed submission.
- Handle loading, duplicate submit, success, validation error, network error, and unauthorized states.
- Keep client validation aligned with server validation.
- Server remains the source of truth for enforcement.

## Placement

| Logic | Location |
| --- | --- |
| Field rendering | Form component or existing field primitive |
| Product validation rule | Schema/domain layer |
| Draft state | Form library or form component |
| Cross-route draft | Feature store or persistence layer |
| Submit side effects | Mutation/action layer |
| Server validation mapping | API/action adapter or form submit handler |

## Smells

- A second validation library added for one form.
- Field components that bypass the design system.
- Client-only validation treated as security or business enforcement.
- Disabled submit with no visible reason.
- Errors shown only in toasts when field-level context is needed.
