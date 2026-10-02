# AGENTS.md

Guidance for AI agents and contributors working in this repository.

## Project

SwiftADIFLib is a Swift package library for parsing, generating, and working with
the Amateur Data Interchange Format (ADIF) as used by amateur radio logging
software.

## The ADIF specification

The normative source is <https://adif.org/adif>. Never invent field names, data
types, enumerations, or rules. Look them up.

- **Use <https://adif.org/adif> for everything.** That page always redirects to
  the most current released specification, so it never goes stale. Do not
  hardcode a version-pinned URL such as `https://adif.org/317/ADIF_317.htm` in
  comments, code, or docs; follow the redirect instead.
- The spec page includes the release notes at the top. The annotated version of
  the same page marks additions and deletions since the previous release, which
  is the fastest way to see what changed.

Always target the most current released version. When a new ADIF release appears:

1. Read its release notes and the annotated spec to get the exact list of added
   and changed items.
2. Update the version constant in the library (search for the version string
   first so it lives in one obvious place).
3. Update every affected field, data type, and enumeration, plus tests for each.

Cite the spec section or field name in comments when behavior is non-obvious.

## Testing

Every new or modified function needs unit test coverage.

- Tests live in the test target (`Tests/`). Use Swift Testing (`import Testing`),
  not XCTest: `@Suite` structs, `@Test` functions, and the built-in `#expect` /
  `#require` macros. Parameterize with `@Test(arguments:)` instead of writing
  separate methods per case, and group related cases with nested `@Suite` types.
- Prefer round-trip coverage for parsers and serializers: parse a fixture, assert
  on the model, serialize, assert the output equals the input.
- Include edge cases: missing fields, empty values, malformed input, and spec
  quirks you deliberately handle.
- Run the full suite before every commit: `swift test`.
- Never commit with a failing suite.
- When a test fails, first check whether the function or the spec changed. Decide
  explicitly which one is wrong and fix that side. Do not silently relax an
  assertion to make it green, and do not delete a failing test to unblock a commit.
- Keep fixtures as files under the test target resources when input is large.

## Documentation

Everything publicly accessible must be documented so consumers can use the
library from Quick Help.

- Document all `public` and `open` declarations: types, properties, initializers,
  methods, subscripts, and protocol conformances.
- Each doc comment starts with a one-line summary of what it does.
- Include `- Parameter:` for inputs, `- Returns:`, and `- Throws:` when relevant.
- Add `- Note:` or a body paragraph for spec-derived rules, format constraints, or
  caveats that callers need to know.
- Public types get at least a doc comment describing the concept they model.
- Match the existing documentation style in the codebase; use triple-slash
  comments and keep lines reasonably short.

## Conventions

- Follow the Swift API Design Guidelines and whatever conventions the existing
  code already uses; consistency with surrounding code wins over personal
  preference.
- No new dependencies unless clearly justified. The package should stay
  Foundation-only unless there is a strong reason.
- Keep `internal` for anything not intended as API surface.
- Prefer value semantics and `struct`/`enum` where it fits.

## Formatting

- 4-space indentation. No tabs.
- Declare `let`, `var`, and computed `var` properties before any initializer in
  a class or struct, including before the initializers that assign them.
- Group every initializer of a class or struct together, with nothing in
  between them. No other function, computed property, or helper may separate one
  initializer from the next:

  ```swift
  // Bad
  init(name: String) { ... }

  func validate() throws { ... }

  init(parsing text: String) throws { ... }

  // Good
  init(name: String) { ... }

  init(parsing text: String) throws { ... }

  func validate() throws { ... }
  ```

- Put a blank line after every `guard` statement, before the code it guards.
- Put a blank line before every `return` statement.
- Never collapse an `else` onto a single line. Expand it to its own line:

  ```swift
  // Bad
  guard x else { return nil }

  // Good
  guard x else {
      return nil
  }
  ```

- Never collapse a `switch` case onto a single line. Always put the case body on
  the next line, indented:

  ```swift
  // Bad
  case .foo: "bar"

  // Good
  case .foo:
      "bar"
  ```

- Separate `let`/`var` declarations from the code that uses them with a blank
  line when the separation makes the code easier to scan.

## Workflow

- Fix any error before adding more files or code. When the editor reports an
  error, resolve it first and confirm the build is clean, then continue.
- Check diagnostics as you go rather than only at the end:
  `XcodeRefreshCodeIssuesInFile` for a fast per-file check, `BuildProject` for
  a full build.

## Definition of done

A change is complete when:

- The implementation is in place and follows existing patterns.
- Unit tests cover the new or changed behavior and pass via `swift test`.
- All new or changed public API is documented.
- Nothing in the change contradicts the current ADIF specification.
