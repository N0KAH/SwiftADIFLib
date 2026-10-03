# AGENTS.md

Guidance for AI agents and contributors working in this repository.

## Project

SwiftADIFLib is a Swift package library for parsing, generating, and working with
the Amateur Data Interchange Format (ADIF) as used by amateur radio logging
software.

## Source layout

Group files by the part of an ADIF file they model. The target root holds only
cross-cutting machinery; everything else lives in one of two folders.

```
Sources/SwiftADIFLib/
├── Header/     the header aggregate and its own field types
├── Records/    field-level vocabulary, enumerations, and the record model
├── ADIFError.swift
└── ADITagScanner.swift
```

- `Header/` — `ADIHeader`, `ADIHeaderTimestamp`, `ADIFVersion`,
  `ADIHeaderUserDefinedField`, and `ADIHeaderUserDefinedFieldSpecification`.
  This list is closed by the specification: an ADI header has no other fields.
- `Records/` — everything a single ADI field can be: `ADIFieldName`,
  `ADIDataSpecifier`, `ADIDataTypeIndicator`, `ADIDate`, `ADITime`,
  `ADIUnknownField`, `ADICalendar`, `ADIEnumeration`, and one file per
  enumeration from section III.B of the specification.
- The target root — types used regardless of which part of the file is being
  read: `ADIFError` and `ADITagScanner`.

A file belongs in `Records/` when it models a field, even if `Header/` also uses
it. `ADIUnknownField`, `ADIDataSpecifier`, and `ADICalendar` are all read by the
header because a header field is an ADI field; they stay in `Records/`. A type
belongs at the root only when it is machinery rather than a model of the format
itself.

Other rules:

- One public type per file, and the file name matches the type name.
- Every public type is prefixed `ADI`, including header-specific types such as
  `ADIHeaderUserDefinedField`, so that several types adopted by a consumer do
  not collide with the consumer's own names.
- Put a new field's type in `Records/`, and a new header field's type in
  `Header/`. Do not create a folder for a single type, and do not add a third
  folder without a clear domain boundary.
- Tests stay flat in `Tests/SwiftADIFLibTests/`. Name a test file after the type
  it covers (`ADIHeaderTests.swift` for `ADIHeader.swift`), including
  `ADIHeader` prefixed types, so the pairing is obvious.

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
3. Run the scripts in `Scripts/` to re-extract the specification tables and
   regenerate the reference types (see below).
4. Update every affected field, data type, and enumeration, plus tests for each.

Cite the spec section or field name in comments when behavior is non-obvious.

### Generated reference types

The enumerations in `Records/` are generated, not hand-edited. Two scripts
reproduce them from the specification document:

```sh
# Download the specification to Scripts/spec.htm from https://adif.org/adif
python3 Scripts/extract_spec.py                # -> Scripts/spec_model.json
python3 Scripts/generate_reference_types.py    # -> Scripts/build (scratch copy)
```

To refresh the checked-in sources, pass `--in-place`:

```sh
python3 Scripts/generate_reference_types.py --in-place   # -> Records/
```

- Leave the generator's output directory alone when checking your work. A bare
  run goes to a scratch copy for exactly that reason: rewriting a file with
  identical content still bumps its modification date, which makes Xcode
  re-index the package and can hang the IDE. The scripts now compare content and
  skip the write when nothing changed, so a repeated run over an unchanged
  specification touches nothing at all.
- The same applies to `Scripts/spec_model.json` and `Scripts/enum_model.json`,
  which are also left alone when their content is unchanged. Do not delete them
  to "force" a regeneration; change the input and let the comparison decide.

Neither the document nor the model is committed; `Scripts/.gitignore` excludes
both. Every file the scripts touch is generated from a manifest that names the
specification table it reads and the number of data rows the specification is
expected to hold, so a new ADIF release fails with `expected N data rows, found
M` rather than generating something quietly wrong. `MANIFEST` holds the
enumerations and `EXPECTED` holds the subdivision and field tables, which are
described rather than enumerated.

Two details in `adif_table.py` are load-bearing, because the specification shares
cells across logical rows and a reader that ignores that produces plausible but
wrong output:

- `rowspan` and `colspan` are expanded onto a grid before rows are read. A `<td
  rowspan="4">` holding one DXCC entity code covers a whole group of schemes, and
  reading rows as flat cell lists shifts every continuation row a column left.
- Tables are addressed individually. The QSO field table directly follows Submode,
  and reading sequentially once appended its 181 field names to `ADISubmode`.

`extract_spec.py` also refuses an extraction in which an enumeration holds a row
carrying a Data Type, since the field tables are the only ones with that column.
Prefer changing `MANIFEST` and the overrides in `generate_reference_types.py` over
editing generated sources; an edit to a generated file is lost on the next run.

Two specification quirks the generated types have to respect, both of which the
tests pin down:

- A primary subdivision code is unique only within its DXCC entity, so
  `ADIPrimaryAdministrativeSubdivision` takes the entity as part of the key.
  `15/01`, `227/01` and `70/01` are all different places.
- Two codes are reused *within* one entity, because the specification names both
  the subdivision retired at a date and its replacement: `15/PM` and `206/BM`.
  The lookup therefore keeps every candidate and reports them at generation
  time, rather than resolving to whichever row came first.

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
- Real-world and oversized input belongs in `TestFiles/` at the repository root,
  one file per fixture, named after where it came from -- `FromRumlog.adi` is
  exported by RumLogNG. Commit those files; they are the input half of the
  round-trip tests.
- A `.adi` extension marks a file in the ADI format, so a test can hand it
  straight to the parser without conversion. Keep the extension: it is what
  tells a reader which format the bytes are in.
- That directory is not a SwiftPM resource, so reach a fixture by resolving
  `#filePath` rather than `Bundle.module`, which is unavailable here. Use
  `ADIFixture.url(named:)` from the test target instead of re-deriving the path
  in every suite.
- When a test covers several types, keep one suite per type rather than a single
  combined suite, so a failure points at one file.

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
- Enumerations from the specification conform to `ADIEnumeration` and follow one
  shape, so that generic code can treat them alike:
  - One case per value the specification defines, in specification order, plus
    `unrecognized(String)`. Never reject a value just because the library has
    not seen it; a later specification release will define it.
  - Name a case for what the value means rather than mechanically from its code,
    so `ADIQSOComplete.yes` and `ADIAntPath.grayline` read as English. Where the
    specification's own wording is already a good identifier, such as
    `ADIARRLSection.alabama`, use that instead of the abbreviation.
  - `description` returns the specification's canonical spelling, including
    punctuation and case, so that `description` reproduces the value in a log
    file exactly and a parse-and-serialize round trip is lossless.
  - `init(rawValue:)` matches without regard to case, as the specification
    requires, and never fails: a value the specification does not define becomes
    `unrecognized(String)` carrying the text it was read from, so a round trip
    cannot discard it. Callers that need to reject unknown values check
    `isRecognized`.
  - A value the specification marks import-only is documented as such and
    reachable through `isImportOnly`; it is never dropped from `allMembers`.
  - Assert each enumeration's member count in its tests, so a transcription that
    is short or long a value fails instead of passing quietly.

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
