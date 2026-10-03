#!/usr/bin/env python3
"""Generate Swift reference sources for the ADIF specification's enumerations.

Reads spec_model.json, produced by extract_spec.py from the specification HTML,
and emits one Swift file per enumeration into the Records directory. Case names
are chosen for readability rather than mechanically: the specification's own
meaning column names many values far better than their one- or two-letter codes.

Usage:
    python3 Scripts/generate_reference_types.py [outdir] [--in-place]

With no outdir the sources land in Scripts/build, so a check run cannot disturb
the package Xcode has open. Pass --in-place, or name Records/ directly, to write
the real sources. Files whose content already matches are left untouched rather
than rewritten, so a verification run over unchanged sources touches nothing.

Run extract_spec.py first; every count this script reports is a check against the
specification rather than a description of the generated code.
"""
import json, re, os, sys, keyword, hashlib

HERE = os.path.dirname(os.path.abspath(__file__))
MODEL = json.load(open(os.path.join(HERE, "spec_model.json")))
RECORDS = os.path.join(os.path.dirname(HERE), "Sources", "SwiftADIFLib", "Records")


def write_if_changed(path, text):
    """Write text, but leave the file alone when it already matches.

    Every generated source is a member of the Swift package Xcode has open, so
    rewriting it with identical content still bumps its modification date and
    makes Xcode re-index the whole module. Writing only real changes keeps a
    verification run free of that churn.
    """
    if os.path.exists(path):
        with open(path) as handle:
            if handle.read() == text:
                return False

    with open(path, "w") as handle:
        handle.write(text)

    return True


def write_source(outdir, name, lines):
    """Write one generated Swift file, returning whether it changed."""
    return write_if_changed(os.path.join(outdir, name + ".swift"), "\n".join(lines))

# spec section, Swift type suffix, specification title, name column
CLOSED = [
    ("III.B.1. Ant Path Enumeration", "AntPath", "Ant Path"),
    ("III.B.2. ARRL Section Enumeration", "ARRLSection", "ARRL Section"),
    ("III.B.3. Award Enumeration (import-only)", "Award", "Award"),
    ("III.B.4. Band Enumeration", "Band", "Band"),
    ("III.B.5. Contest ID Enumeration", "ContestID", "Contest ID"),
    ("III.B.6. Continent Enumeration", "Continent", "Continent"),
    ("III.B.9. EQSL_AG Enumeration", "EQSL_AG", "EQSL_AG"),
    ("III.B.10. Mode Enumeration", "Mode", "Mode"),
    ("III.B.11. Morse Key Type Enumeration", "MorseKeyType", "Morse Key Type"),
    ("III.B.13. Propagation Mode Enumeration", "PropagationMode", "Propagation Mode"),
    ("III.B.14. QSL Medium Enumeration", "QSLMedium", "QSL Medium"),
    ("III.B.15. QSL Rcvd Enumeration", "QSLRcvd", "QSL Rcvd"),
    ("III.B.16. QSL Sent Enumeration", "QSLSent", "QSL Sent"),
    ("III.B.17. QSL Via Enumeration", "QSLVia", "QSL Via"),
    ("III.B.18. QSO Complete Enumeration", "QSOComplete", "QSO Complete"),
    ("III.B.19. QSO Download Status Enumeration", "QSODownloadStatus", "QSO Download Status"),
    ("III.B.20. QSO Upload Status Enumeration", "QSOUploadStatus", "QSO Upload Status"),
    ("III.B.24. Sponsored Award Enumeration", "SponsoredAward", "Sponsored Award"),
    ("III.B.25. Submode Enumeration", "Submode", "Submode"),
]

# Case names taken from each value's specification meaning rather than its code.
# Used where the code alone would read as "y", "n", or "b" in Swift.
OVERRIDES = {
    "ADIAntPath": {"G": "grayline", "O": "other", "S": "shortPath", "L": "longPath"},
    "ADIEQSL_AG": {"Y": "yes", "N": "no", "U": "unspecified"},
    "ADIMorseKeyType": {
        "SK": "straightKey", "SS": "sideswiper", "BUG": "bug",
        "FAB": "fullyAutomaticKeyer", "SP": "singlePaddle",
        "DP": "dualPaddle", "CPU": "computerDriven",
    },
    "ADIQSLRcvd": {
        "Y": "yes", "N": "no", "R": "requested",
        "I": "ignoreOrInvalid", "V": "verified",
    },
    "ADIQSLSent": {
        "Y": "yes", "N": "no", "R": "requested",
        "Q": "queued", "I": "ignoreOrInvalid",
    },
    "ADIQSLVia": {"B": "bureau", "D": "direct", "E": "electronic", "M": "manager"},
    "ADIContinent": {
        "NA": "northAmerica", "SA": "southAmerica", "EU": "europe", "AF": "africa",
        "OC": "oceania", "AS": "asia", "AN": "antarctica",
    },
    "ADIPropagationMode": {
        "AS": "aircraftScatter", "AUE": "auroraE", "AUR": "aurora",
        "BS": "backScatter", "ECH": "echoLink", "EME": "earthMoonEarth",
        "ES": "sporadicE", "F2": "f2Reflection",
        "FAI": "fieldAlignedIrregularities", "GWAVE": "groundWave",
        "INTERNET": "internetAssisted", "ION": "ionoscatter", "IRL": "irlp",
        "LOS": "lineOfSight", "MS": "meteorScatter", "RPT": "repeaterOrTransponder",
        "RS": "rainScatter", "SAT": "satellite", "TEP": "transEquatorial",
        "TR": "troposphericDucting",
    },
    "ADIQSOComplete": {"Y": "yes", "N": "no", "NIL": "notHeard", "?": "uncertain"},
    "ADIQSODownloadStatus": {"Y": "yes", "N": "no", "I": "ignoreOrInvalid"},
    "ADIQSOUploadStatus": {"Y": "yes", "N": "no", "M": "modified"},
}

# Python's keyword module does not know Swift's reserved words.
SWIFT_KEYWORDS = {
    "Any", "Protocol", "Self", "Type", "actor", "associatedtype", "associativity",
    "break", "case", "catch", "class", "continue", "convenience", "default",
    "defer", "deinit", "didSet", "dynamic", "else", "enum", "extension", "fallthrough",
    "false", "fileprivate", "final", "for", "func", "get", "guard", "if", "import",
    "in", "indirect", "infix", "init", "inout", "internal", "is", "isolated", "lazy",
    "left", "let", "mutating", "nil", "none", "nonisolated", "nonmutating", "open",
    "operator", "optional", "override", "package", "postfix", "precedence",
    "precedencegroup", "prefix", "private", "protocol", "public", "repeat", "required",
    "rethrows", "return", "right", "set", "some", "static", "struct", "subscript",
    "super", "switch", "throw", "throws", "true", "try", "typealias", "unowned",
    "var", "weak", "where", "while", "willSet", "async", "await", "actor", "consume",
    "borrowing", "consuming", "each", "macro", "any", "distributed",
}

IMPORT_ONLY = re.compile(r"\s*\(import-only\)\s*$", re.I)


def collapse(text):
    return re.sub(r"\s+", " ", text or "").strip()


def fold(token):
    """Lower-case a specification token that is capitalised as a single word.

    The specification writes some values as one capitalised run -- SPDXContest,
    USERDEFn -- which would otherwise become identifiers such as "sPDXContest".
    """
    if token.isupper() or re.match(r"^[A-Z]{2,}[a-z]", token):
        return token.lower()
    return token


def camel(text, limit=None, prefix=""):
    """Camel-case specification text into a Swift identifier.

    The specification writes many values in capitals -- PSK31, ADIF_, CHIP -- so a
    token with no lowercase letters is folded to lower case to avoid names such as
    "pSK31". Values that begin with a digit take the enumeration's name as a
    prefix, giving "band2190m" rather than an identifier Swift cannot parse.
    """
    tokens = [t for t in re.sub(r"[^0-9A-Za-z]+", " ", text or "").split() if t]
    if limit is not None:
        tokens = tokens[:limit]
    if not tokens:
        return ""
    words = [fold(t) for t in tokens]
    name = words[0][0].lower() + words[0][1:]
    for word in words[1:]:
        name += word[0].upper() + word[1:]
    if prefix and not name[0].isalpha():
        name = prefix + name
    return name


def case_name(raw, typename, meaning, title):
    """Choose a readable Swift case name for a specification value."""
    override = OVERRIDES.get("ADI" + typename, {}).get(raw)
    if override:
        return override
    prefix = camel(typename) or "value"
    if typename == "ARRLSection":
        # The specification's section names are unique, so they read far better
        # than the two-letter abbreviations.
        return camel(meaning, prefix=prefix) or camel(raw, prefix=prefix)
    return camel(raw, prefix=prefix) or camel(title, prefix=prefix) or "value"


def doc(text, indent):
    """Wrap a specification string into `///` comment lines at 76 columns."""
    lines, current = [], ""
    for word in collapse(text).split(" "):
        if not word:
            continue
        if current and len(current) + 1 + len(word) > 76:
            lines.append(current)
            current = word
        else:
            current = f"{current} {word}".strip()
    if current:
        lines.append(current)
    return [f"{indent}/// {line}".rstrip() for line in lines]


def read_headers(key):
    return [collapse(c) for c in rows_of(key, "header")]


def rows_of(key, field="rows"):
    """Read one section's rows out of the extracted model."""
    return MODEL["enumerations"][key][field]


def read_members(key):
    members = []
    for row in rows_of(key):
        if not row or not row[0]:
            continue
        raw = re.sub(IMPORT_ONLY, "", row[0]).strip()
        members.append({
            "raw": raw,
            "importOnly": bool(IMPORT_ONLY.search(row[0])),
            "cols": [collapse(c) for c in row],
        })
    return members


def emit(key, typename, title, outdir):
    headers = read_headers(key)
    members = read_members(key)
    used = set()
    for member in members:
        meaning = member["cols"][1] if len(member["cols"]) > 1 else ""
        name = case_name(member["raw"], typename, meaning, title)
        if name in SWIFT_KEYWORDS or name in used:
            tail = camel(member["raw"])
            name = name + (tail[:1].upper() + tail[1:] if tail and tail != name else "Value")
        while name in used or name in SWIFT_KEYWORDS:
            name += "Value"
        used.add(name)
        member["case"] = name

    t = "ADI" + typename
    out = []
    add = out.append
    add(f"/// The ADIF `{title}` enumeration.")
    add("///")
    add(f"/// - Note: See the specification's section III.B for the authoritative list of")
    add(f"///   {title.lower()} values.")
    add(f"public enum {t}: ADIEnumeration {{")
    for member in members:
        details = []
        for index, column in enumerate(member["cols"][1:], start=1):
            if not column or column == member["raw"]:
                continue
            label = headers[index] if index < len(headers) else ""
            if label and label.lower() in ("meaning", "description", "continent",
                                           "section name", "medium"):
                details.append(column)
            elif label:
                details.append(f"{label}: {column}")
            else:
                details.append(column)
        details = [d for d in details if camel(d.split(": ")[-1]) != member["case"]]
        if not details:
            # The specification's own wording only restates the case name, so
            # cross-reference the value instead of repeating it.
            add(f"    /// The specification's `{member['raw']}` value.")
        else:
            add("    ///")
            for detail in details:
                for line in doc(detail, "    "):
                    add(line)
                if detail != details[-1]:
                    add("    ///")
        if member["importOnly"]:
            add("    ///")
            add("    /// - Note: The specification marks this value as import-only, meaning it")
            add("    ///   conveys something read from a file rather than something a logging")
            add("    ///   station creates.")
        add(f"    case {member['case']}")
    add("")
    add("    /// A value that this library does not recognize.")
    add("    ///")
    add("    /// - Important: This case exists so that unrecognized values survive a")
    add("    ///   parse-and-serialize round trip rather than being discarded.")
    add("    case unrecognized(String)")
    add("")
    add(f"    /// Every value the specification defines for this enumeration, in")
    add(f"    /// specification order, excluding ``{t}.unrecognized(_:)``.")
    add(f"    public static let allMembers: [{t}] = [")
    for member in members:
        add(f"        .{member['case']},")
    add("    ]")
    add("")
    add("    /// The values the specification marks as import-only.")
    add("    ///")
    add("    /// - Note: Empty for enumerations that define no import-only values.")
    io = [m for m in members if m["importOnly"]]
    if io:
        add("    public static let importOnlyMembers: Set<String> = [")
        for member in io:
            add(f'        "{member["raw"]}",')
        add("    ]")
    else:
        add("    public static let importOnlyMembers: Set<String> = []")
    add("")
    add("    /// The value in the canonical form the specification uses.")
    add("    public var description: String {")
    add("        switch self {")
    for member in members:
        add(f'        case .{member["case"]}:')
        add(f'            "{member["raw"]}"')
    add("        case let .unrecognized(raw):")
    add("            raw")
    add("        }")
    add("    }")
    add("")
    add(f"    private static let membersByLowercasedValue: [String: {t}] = [")
    for member in members:
        add(f'        "{member["raw"].lower()}": .{member["case"]},')
    add("    ]")
    add("")
    add("    /// Creates a value from its textual form.")
    add("    ///")
    add("    /// - Parameter rawValue: The value, in any case.")
    add("    /// - Returns: The matching member, or `.unrecognized` when `rawValue` names")
    add("    ///   no value the specification defines.")
    add("    public init(rawValue: some StringProtocol) {")
    add("        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {")
    add("            self = .unrecognized(rawValue.description)")
    add("")
    add("            return")
    add("        }")
    add("")
    add("        self = member")
    add("    }")
    add("}")
    add("")

    write_source(outdir, t, out)
    return t, members


# The enumerations the specification defines for QSO fields, mapped to the Swift
# type that models each one.
RECORD_ENUMERATIONS = {
    "Ant Path": "ADIAntPath",
    "ARRL Section": "ADIARRLSection",
    "Band": "ADIBand",
    "Contest ID": "ADIContestID",
    "Continent": "ADIContinent",
    "Credit Award (import-only)": "ADICredit",
    "DXCC Entity Code": "ADIDXCCEntityCode",
    "EQSL_AG": "ADIEQSL_AG",
    "Mode": "ADIMode",
    "Morse Key Type": "ADIMorseKeyType",
    "Propagation Mode": "ADIPropagationMode",
    "QSL Rcvd": "ADIQSLRcvd",
    "QSL Sent": "ADIQSLSent",
    "QSL Via": "ADIQSLVia",
    "QSO Complete": "ADIQSOComplete",
    "QSO Download Status": "ADIQSODownloadStatus",
    "QSO Upload Status": "ADIQSOUploadStatus",
    "Sponsored Award": "ADISponsoredAward",
    "Submode (function of MODE field's value)": "ADISubmode",
}

# Fields the specification types as `Enumeration` while publishing no values for
# them. An administrative subdivision code means nothing without the DXCC entity
# that issued it, the DARC codes are published on the DARC website, and
# MY_COUNTRY holds an entity name rather than a code. Each stays a String, and
# the record resolves the subdivisions through ADIPrimaryAdministrativeSubdivision.
RECORD_UNENUMERATED = {
    "(DOKs and Special DOKs listed on the DARC website)",
    "(Primary Administrative Subdivision, function of DXCC field's value)",
    "(Primary Administrative Subdivision, function of MY_DXCC field's value)",
    "(Secondary Administrative Subdivision, function of DXCC field's value)",
    "(Secondary Administrative Subdivision, function of MY_DXCC field's value)",
    # A region code is likewise unique only within its entity, which is why
    # ADIRegion is a keyed table rather than an ADIEnumeration.
    "Region",
    "Country",
}

# Data types that are not enumerations, mapped to the Swift type holding them.
RECORD_DATA_TYPES = {
    "Boolean": "Bool",
    "CreditList AwardList (import-only)": "[ADICredit]",
    "Date": "ADIDate",
    "GridSquare": "String",
    "GridSquareExt": "String",
    "GridSquareList": "[String]",
    "IOTARefNo": "String",
    "IntlMultilineString": "String",
    "IntlString": "String",
    "Integer": "Int",
    "Location": "Double",
    "MultilineString": "String",
    "Number": "Double",
    "POTARefList": "[String]",
    "PositiveInteger": "Int",
    "SOTARef": "String",
    "SecondaryAdministrativeSubdivisionListAlt": "[String]",
    "SecondarySubdivisionList": "[String]",
    "SponsoredAwardList": "[ADISponsoredAward]",
    "String": "String",
    "Time": "ADITime",
    "WWFFRef": "String",
}

# Fields whose property name departs from the mechanical camel-cased field name.
#
# The first group is the fields whose camel-cased form is a Swift keyword, each
# named for what the specification says the field holds. `OPERATOR` is spelled
# `operatorCallsign` rather than with a `my` prefix: the specification defines no
# `MY_OPERATOR` field, and 42 properties that genuinely are `MY_*` fields would
# otherwise make the prefix look meaningful where it is not.
#
# The second group is named for the specification's own wording, so that the
# logging station reads consistently across the resolved properties.
RECORD_RENAMES = {
    "CLASS": "contestClass",
    "OPERATOR": "operatorCallsign",
    "PRECEDENCE": "contestPrecedence",
    "STATION_CALLSIGN": "loggingStationCallsign",
}

# The fields the convenience initializer accepts. Every other field is set by
# assigning its property, so this is the common case rather than a required set.
RECORD_CORE = ["CALL", "QSO_DATE", "TIME_ON", "BAND", "MODE", "FREQ", "DXCC"]

# Keywords and reserved words a mechanical camel-cased field name could produce.
# Checked so that a later release adding such a field fails at generation time
# rather than emitting a file that will not compile.
SWIFT_RESERVED = set(
    """
    Any Self Type Protocol as associatedtype await break case catch class continue
    default defer deinit do dynamic else enum extension fallthrough false fileprivate
    final for func get guard if import indirect in infix init inout internal is lazy
    left let mutating nil none nonmutating open operator optional override postfix
    precedence prefix private protocol public repeat required rethrows return right
    self set some static struct subscript super switch throw throws true try typealias
    unowned var weak where while willSet didSet
    """.split()
)


def camel_field(name):
    """Camel-case a field name the way the record's properties are spelled.

    Distinct from the `camel` above, which builds an enumeration case name from a
    specification meaning and takes a type prefix.
    """
    parts = name.lower().split("_")
    joined = parts[0] + "".join(part.capitalize() for part in parts[1:])

    return joined[:1].lower() + joined[1:]


def record_property(field):
    """The Swift property name modelling one QSO field."""
    name = field["name"]
    prop = RECORD_RENAMES.get(name) or camel_field(name)

    if prop in SWIFT_RESERVED:
        fail(f"{name} camel-cases to the Swift reserved word {prop!r}; add a rename")

    return prop


def record_type(field):
    """The Swift type modelling one QSO field's data."""
    name = field["name"]
    enumeration = field["enumeration"]
    data_type = field["type"]

    # A list data type carries its own element type, and wins over the field's
    # enumeration: CREDIT_SUBMITTED is a list of Award values, not one of them.
    mapped = RECORD_DATA_TYPES.get(data_type)
    if mapped and mapped.startswith("["):
        return mapped

    if enumeration in RECORD_ENUMERATIONS:
        return RECORD_ENUMERATIONS[enumeration]

    if enumeration and enumeration not in RECORD_UNENUMERATED:
        fail(f"{name} names enumeration {enumeration!r}, which has no Swift type")

    if enumeration:
        return "String"

    if mapped:
        return mapped

    fail(f"{name} has data type {data_type!r}, which has no Swift type")


def record_read(swift, field_name):
    """The expression reading one field's data out of a specifier."""
    if swift.startswith("["):
        element = swift[1:-1]
        if element == "String":
            return "ADIRecordCoder.list(specifier.data)"

        return f"ADIRecordCoder.enumerationList(specifier.data, as: {element}.self)"

    if swift == "String":
        return "specifier.data"

    coder = {
        "ADIDate": "date",
        "ADITime": "time",
        "Bool": "boolean",
        "Double": "number",
        "Int": "integer",
    }.get(swift)

    if coder:
        return f"try ADIRecordCoder.{coder}(specifier.data, field: {lit(field_name)})"

    if swift in RECORD_ENUMERATIONS.values():
        return f"ADIRecordCoder.enumeration(specifier.data, as: {swift}.self)"

    fail(f"no reader for Swift type {swift!r}")


def record_write(swift, value):
    """The expression rendering one field's value as its ADI text."""
    if swift.startswith("["):
        element = swift[1:-1]
        if element == "String":
            return f"{value}.joined(separator: \",\")"

        return f"{value}.map {{ $0.description }}.joined(separator: \",\")"

    if swift == "Bool":
        # A Boolean is written as a single Y or N; `true` is not ADI text.
        return f'{value} ? "Y" : "N"'

    return f"{value}.description"


def emit_record(outdir):
    """Write ADIRecord, one property per QSO field the specification defines."""
    fields = MODEL["fields"]["qso"]
    resolved = [
        (field["name"], record_property(field), record_type(field), field["comment"])
        for field in fields
    ]

    by_name = {name: (prop, swift) for name, prop, swift, _ in resolved}
    for required in RECORD_CORE:
        if required not in by_name:
            fail(f"the convenience initializer wants {required}, which the field table lacks")

    out = []

    def add(text=""):
        out.append(text)

    add("// This file is generated by Scripts/generate_reference_types.py. Do not edit it by hand.")
    add("")
    add("/// One QSO record: a single contact, as an ADI file records it.")
    add("///")
    add("/// A record is the sequence of Data-Specifiers that a logging station writes for one")
    add("/// contact, terminated by the `<EOR>` tag. This type models every field the ADIF")
    add("/// specification defines for a QSO record, one property per field, so a parsed")
    add("/// contact is reachable by name rather than by string lookup.")
    add("///")
    add("/// - Note: Properties are generated from the specification's field table, so their")
    add("///   names follow the field names it uses. `CLASS` is ``contestClass`` and `PRECEDENCE`")
    add("///   is ``contestPrecedence`` because the mechanical form is a Swift keyword, and")
    add("///   `OPERATOR` is ``operatorCallsign`` because the specification defines no")
    add("///   `MY_OPERATOR` field, which would make a `my` prefix look meaningful where it is")
    add("///   not. `STATION_CALLSIGN` is ``loggingStationCallsign``, after the specification's")
    add("///   own wording, so that the logging station reads the same way throughout.")
    add("///")
    add("/// - Note: A field the specification types as an enumeration is held as its `ADI` type,")
    add("///   which never fails to parse: a value the specification has not published yet is")
    add("///   preserved as `unrecognized` rather than discarded.")
    add("public struct ADIRecord: Hashable, Sendable {")

    for name, prop, swift, comment in resolved:
        add("")
        summary = collapse(comment).strip()
        summary = summary[:1].upper() + summary[1:] if summary else name
        if not summary.endswith("."):
            summary += "."
        for line in doc(summary, "    "):
            add(line)
        add("    ///")
        add(f"    /// - Note: The specification's `{name}` field.")
        add(f"    public var {prop}: {swift}?")

    add("")
    add("    /// Fields this library does not model explicitly.")
    add("    ///")
    add("    /// A record may hold fields added by a later release of the specification, or")
    add("    /// fields belonging to a non-standard tool. Reading collects them here so that")
    add("    /// parsing and re-serializing content does not silently discard data.")
    add("    ///")
    add("    /// - Note: Unrecognized fields come into existence only by reading content, so")
    add("    ///   this array is empty for a record you generate.")
    add("    public var unknownFields: [ADIUnknownField]")
    add("")
    add("    /// The contacted station's primary administrative subdivision, resolved against")
    add("    /// the record's `DXCC` entity.")
    add("    ///")
    add("    /// A primary subdivision code is unique only within the entity that issues it,")
    add("    /// which is why `STATE` is stored as text and resolved here.")
    add("    ///")
    add("    /// - Returns: The subdivision, or `nil` if either the code or the entity is")
    add("    ///   absent, or the specification defines no such code for that entity.")
    add("    public var contactedStationSubdivision: ADIPrimaryAdministrativeSubdivision? {")
    add("        guard let state, let dxcc else {")
    add("            return nil")
    add("        }")
    add("")
    add("        return ADIPrimaryAdministrativeSubdivision(code: state, dxccEntityCode: dxcc.description)")
    add("    }")
    add("")
    add("    /// The contacted station's region within its DXCC entity.")
    add("    ///")
    add("    /// A region code is unique only within the entity that issues it, which is why")
    add("    /// `REGION` is stored as text and resolved here.")
    add("    ///")
    add("    /// - Returns: The region, or `nil` if either the code or the entity is absent,")
    add("    ///   or the specification defines no such code for that entity.")
    add("    public var contactedStationRegion: ADIRegion? {")
    add("        guard let region, let dxcc else {")
    add("            return nil")
    add("        }")
    add("")
    add("        return ADIRegion(code: region, dxccEntityCode: dxcc.description)")
    add("    }")
    add("")
    add("    /// The logging station's primary administrative subdivision, resolved against")
    add("    /// the record's `MY_DXCC` entity.")
    add("    ///")
    add("    /// - Returns: The subdivision, or `nil` if either the code or the entity is")
    add("    ///   absent, or the specification defines no such code for that entity.")
    add("    public var loggingStationSubdivision: ADIPrimaryAdministrativeSubdivision? {")
    add("        guard let myState, let myDxcc else {")
    add("            return nil")
    add("        }")
    add("")
    add("        return ADIPrimaryAdministrativeSubdivision(code: myState, dxccEntityCode: myDxcc.description)")
    add("    }")
    add("")
    add("    /// Creates an empty record.")
    add("    ///")
    add("    /// Every field is optional, so a record is built by assigning its properties.")
    add("    public init() {")
    add("        unknownFields = []")
    add("    }")
    add("")
    add("    /// Creates a record holding the fields a contact is normally identified by.")
    add("    ///")
    add("    /// - Parameters:")
    core = [(by_name[n][0], by_name[n][1]) for n in RECORD_CORE]
    for index, (prop, swift) in enumerate(core):
        tail = ")" if index == len(core) - 1 else ","
        add(f"    ///   - {prop}: The corresponding field, or `nil`.")
    add("    public init(")
    for index, (prop, swift) in enumerate(core):
        tail = "" if index == len(core) - 1 else ","
        add(f"        {prop}: {swift}? = nil{tail}")
    add("    ) {")
    add("        self.init()")
    for prop, _ in core:
        add(f"        self.{prop} = {prop}")
    add("    }")
    add("")
    add("    /// Parses one record from the text of an ADI record.")
    add("    ///")
    add("    /// - Parameter text: The record's fields, with or without the trailing `<EOR>`")
    add("    ///   tag. Free-form text before the first `<` is ignored, as the specification")
    add("    ///   requires. Fields this library does not recognize are collected into")
    add("    ///   ``unknownFields``.")
    add("    /// - Throws: ``ADIFError`` if a tag is malformed, if a field's data does not")
    add("    ///   match the type the specification gives it, or if a `<EOH>` tag appears")
    add("    ///   where a record field was expected.")
    add("    public init(parsing text: String) throws {")
    add("        self.init()")
    add("")
    add("        var scanner = ADITagScanner(text)")
    add("        _ = scanner.consumeLeadingText()")
    add("")
    add("        while let tag = try scanner.scanTag() {")
    add("            switch tag {")
    add("            case .endOfRecord:")
    add("                return")
    add("            case .endOfHeader:")
    add("                throw ADIFError.unexpectedTagInRecord(name: tag.name)")
    add("            case let .dataSpecifier(specifier):")
    add("                try apply(specifier)")
    add("            }")
    add("        }")
    add("    }")
    add("")
    add("    /// Renders this record in ADI form, including the terminating `<EOR>` tag.")
    add("    ///")
    add("    /// Fields are written in the order the specification presents them, followed by")
    add("    /// any unrecognized fields in the order they were given, so that serializing a")
    add("    /// record twice produces the same text.")
    add("    ///")
    add("    /// - Returns: The record's fields separated by spaces and terminated by")
    add("    ///   `<EOR>`.")
    add("    /// - Throws: ``ADIFError/invalidFieldName(name:reason:)`` if an unrecognized")
    add("    ///   field's name is not usable, or")
    add("    ///   ``ADIFError/unsupportedDataType(dataType:reason:)`` if one carries a data")
    add("    ///   type that may only appear in an ADX file.")
    add("    public func serialized() throws -> String {")
    add("        var specifiers: [ADIDataSpecifier] = []")
    add("")
    for name, prop, swift, _ in resolved:
        add(f"        if let {prop} {{")
        add(f"            specifiers.append(")
        add(f"                try ADIDataSpecifier(name: {lit(name)}, data: {record_write(swift, prop)})")
        add("            )")
        add("        }")
        add("")
    add("        for field in unknownFields {")
    add("            specifiers.append(try field.validatedForADI())")
    add("        }")
    add("")
    add("        guard !specifiers.isEmpty else {")
    add("            return \"<EOR>\"")
    add("        }")
    add("")
    add("        return specifiers.map { $0.serialized() }.joined(separator: \" \") + \" <EOR>\"")
    add("    }")
    add("")
    add("    private mutating func apply(_ specifier: ADIDataSpecifier) throws {")
    add("        switch specifier.name {")
    for name, prop, swift, _ in resolved:
        add(f"        case {lit(name)}:")
        add(f"            {prop} = {record_read(swift, name)}")
    add("        default:")
    add("            unknownFields.append(ADIUnknownField(specifier))")
    add("        }")
    add("    }")
    add("}")

    write_source(outdir, "ADIRecord", out)

    return "ADIRecord", [name for name, _, _, _ in resolved]


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("-")]
    outdir = args[0] if args else os.path.join(HERE, "build")
    if "--in-place" in sys.argv[1:] or os.path.abspath(outdir) == os.path.abspath(RECORDS):
        outdir = RECORDS
    os.makedirs(outdir, exist_ok=True)
    model, total = {}, 0
    for key, typename, title in CLOSED:
        t, members = emit(key, typename, title, outdir)
        io = sum(1 for m in members if m["importOnly"])
        total += len(members)
        model[t] = {
            "specSection": key,
            "specTitle": title,
            "members": [{k: m[k] for k in ("raw", "case", "importOnly", "cols")} for m in members],
        }
        print(f"{t:22} {len(members):4} members, {io:3} import-only")
    for emitter in (emit_dxcc, emit_credit):
        name, members = emitter(outdir)
        model[name] = {
            "specSection": "structured",
            "specTitle": name,
            "members": [{k: v for k, v in member.items()} for member in members],
        }
        print(f"{name:22} {len(members):4} members (with metadata)")
        total += len(members)
    name, regions = emit_region(outdir)
    model[name] = {
        "specSection": "III.B.21. Region Enumeration",
        "specTitle": name,
        "members": regions,
    }
    print(f"{name:22} {len(regions):4} regions (keyed)")

    for emitter, section, label in (
        (emit_primary_subdivisions, "III.B.12. Primary Administrative Subdivision", "subdivisions"),
        (emit_secondary_schemes, "III.B.22./III.B.23. Secondary Administrative Subdivision", "schemes"),
        (emit_alaska_counties, "III.B.22.a. Alaska Counties", "counties"),
        (emit_nz_regions, "III.B.23.a. NZ Regions", "regions"),
    ):
        name, members = emitter(outdir)
        model[name] = {
            "specSection": section,
            "specTitle": name,
            "members": members,
        }
        print(f"{name:40} {len(members):4} {label}")

    # The specification reuses a subdivision code within one DXCC entity where it
    # renamed a subdivision at a date, naming both. Report it rather than let the
    # lookup quietly resolve to whichever came first.
    keys = {}
    for row in MODEL["primarySubdivisions"]:
        keys.setdefault((row["dxccEntityCode"], row["code"]), []).append(row["name"])

    reused = {k: v for k, v in keys.items() if len(v) > 1}
    if reused:
        print(f"  note: {len(reused)} subdivision codes are reused within a DXCC entity")
        for (entity, code), names in sorted(reused.items()):
            print(f"    {entity}/{code}: {' | '.join(names)}")

# The record is not an enumeration, so it does not join the model or the case
    # count; it is the whole QSO field table expressed as one Swift struct.
    record_name, record_fields = emit_record(outdir)
    print(f"{record_name:40} {len(record_fields):4} fields")

    write_if_changed(
        os.path.join(HERE, "enum_model.json"),
        json.dumps(model, indent=1),
    )
    print(f"total cases: {total}")



# ---------------------------------------------------------------------------
# Enumerations that also carry specification metadata, and keyed tables.
# ---------------------------------------------------------------------------

def unique_name(base, suffix):
    return base + (suffix[:1].upper() + suffix[1:] if suffix else "Value")


def emit_dxcc(outdir):
    """III.B.8: DXCC entity codes, each with an entity name and a deleted flag."""
    rows = [r for r in rows_of("III.B.8. DXCC Entity Code Enumeration") if r and r[0]]
    members = []
    for row in rows:
        code = row[0].strip()
        name = collapse(row[1]) if len(row) > 1 else ""
        deleted = bool(len(row) > 2 and row[2].strip())
        members.append({"code": code, "name": name, "deleted": deleted})

    # Two entity names are reused by the deleted and current codes for the same
    # entity, so keep the plain name for the current code.
    by_name = {}
    for member in members:
        by_name.setdefault(member["name"], []).append(member)
    for name, group in by_name.items():
        if len(group) > 1:
            live = [m for m in group if not m["deleted"]]
            if len(live) == 1:
                for member in group:
                    if member["deleted"]:
                        member["name"] = f"{name} (Deleted)"
    used = set()
    for member in members:
        case = camel(member["name"], limit=4) if member["code"] != "0" else "noEntity"
        if case in used or case in SWIFT_KEYWORDS:
            case = unique_name(case, member["code"])
        while case in used or case in SWIFT_KEYWORDS:
            case += "Value"
        used.add(case)
        member["case"] = case

    t = "ADIDXCCEntityCode"
    out = []
    add = out.append
    add("/// The ADIF `DXCC Entity Code` enumeration.")
    add("///")
    add("/// A DXCC entity code identifies a geographic entity for award and credit")
    add("/// purposes. The specification lists every code it has ever assigned, so a code")
    add("/// the specification has since retired is still readable here and is reported by")
    add("/// ``isDeleted`` rather than being dropped.")
    add("///")
    add("/// - Note: See the specification's section III.B for the authoritative list.")
    add(f"public enum {t}: ADIEnumeration {{")
    for member in members:
        # Several entity names end in an abbreviation period; do not double it.
        summary = member["name"] if member["name"].endswith(".") else member["name"] + "."
        add(f"    /// {summary}")
        if member["deleted"]:
            add("    ///")
            add(f"    /// - Note: The specification marks entity code "
                f"`{member['code']}` as deleted.")
        add(f"    case {member['case']}")
    add("")
    add("    /// A value that this library does not recognize.")
    add("    ///")
    add("    /// - Important: This case exists so that unrecognized codes survive a")
    add("    ///   parse-and-serialize round trip rather than being discarded.")
    add("    case unrecognized(String)")
    add("")
    add(f"    /// Every entity code the specification defines, in specification order,")
    add(f"    /// excluding ``{t}.unrecognized(_:)``.")
    add(f"    public static let allMembers: [{t}] = [")
    for member in members:
        add(f"        .{member['case']},")
    add("    ]")
    add("")
    add("    /// The values the specification marks as import-only.")
    add("    ///")
    add("    /// - Note: The specification marks no entity code as import-only.")
    add("    public static let importOnlyMembers: Set<String> = []")
    add("")
    add("    /// The entity name the specification gives this code.")
    add("    ///")
    add("    /// - Note: Undefined codes report the code itself, because the")
    add("    ///   specification names no entity for them.")
    add("    public var name: String {")
    add("        Self.namesByCode[description] ?? description")
    add("    }")
    add("")
    add("    /// Whether the specification marks this entity code as deleted.")
    add("    ///")
    add("    /// - Note: A deleted code is one the specification has retired. It remains")
    add("    ///   readable so that an old log still resolves, but it is no longer a")
    add("    ///   code the specification issues.")
    add("    public var isDeleted: Bool {")
    add("        Self.deletedCodes.contains(description)")
    add("    }")
    add("")
    add("    /// The entity code, in the canonical form the specification uses.")
    add("    public var description: String {")
    add("        switch self {")
    for member in members:
        add(f"        case .{member['case']}:")
        add(f'            "{member["code"]}"')
    add("        case let .unrecognized(raw):")
    add("            raw")
    add("        }")
    add("    }")
    add("")
    add(f"    private static let namesByCode: [String: String] = [")
    for member in members:
        add(f'        "{member["code"]}": "{member["name"]}",')
    add("    ]")
    add("")
    add("    private static let deletedCodes: Set<String> = [")
    for member in members:
        if member["deleted"]:
            add(f'        "{member["code"]}",')
    add("    ]")
    add("")
    add("    private static let membersByValue: [String: " + t + "] = [")
    for member in members:
        add(f'        "{member["code"]}": .{member["case"]},')
    add("    ]")
    add("")
    add("    /// Creates a value from its entity code.")
    add("    ///")
    add("    /// - Parameter rawValue: The entity code.")
    add("    /// - Returns: The matching member, or `.unrecognized` when `rawValue` is no")
    add("    ///   entity code the specification defines.")
    add("    public init(rawValue: some StringProtocol) {")
    add("        guard let member = Self.membersByValue[String(rawValue)] else {")
    add("            self = .unrecognized(rawValue.description)")
    add("")
    add("            return")
    add("        }")
    add("")
    add("        self = member")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, members


def emit_credit(outdir):
    """III.B.7: credit values, each with a sponsor, an award, and a facet."""
    rows = [r for r in rows_of("III.B.7. Credit Enumeration") if r and r[0]]
    members = []
    for row in rows:
        members.append({
            "value": row[0].strip(),
            "sponsor": collapse(row[1]) if len(row) > 1 else "",
            "award": collapse(row[2]) if len(row) > 2 else "",
            "facet": collapse(row[3]) if len(row) > 3 else "",
        })
    used = set()
    for member in members:
        case = camel(member["value"], prefix="credit") or "creditValue"
        if case in used or case in SWIFT_KEYWORDS:
            case = unique_name(case, member["value"])
        while case in used or case in SWIFT_KEYWORDS:
            case += "Value"
        used.add(case)
        member["case"] = case

    t = "ADICredit"
    out = []
    add = out.append
    add("/// The ADIF `Credit` enumeration.")
    add("///")
    add("/// A credit records participation in an award program run by a sponsoring")
    add("/// organization. The specification names each credit's sponsor, the award it")
    add("/// counts toward, and the facet -- such as band or mode -- it applies to.")
    add("///")
    add("/// - Note: See the specification's section III.B for the authoritative list.")
    add(f"public enum {t}: ADIEnumeration {{")
    for member in members:
        detail = f"the {member['facet']} facet of the {member['award']} award"
        add(f"    /// Credit for {detail}, run by {member['sponsor']}.")
        add("    ///")
        add(f"    /// - Note: The specification's value is `{member['value']}`.")
        add(f"    case {member['case']}")
    add("")
    add("    /// A value that this library does not recognize.")
    add("    ///")
    add("    /// - Important: This case exists so that unrecognized credits survive a")
    add("    ///   parse-and-serialize round trip rather than being discarded.")
    add("    case unrecognized(String)")
    add("")
    add("    /// Every credit the specification defines, in specification order,")
    add(f"    /// excluding ``{t}.unrecognized(_:)``.")
    add(f"    public static let allMembers: [{t}] = [")
    for member in members:
        add(f"        .{member['case']},")
    add("    ]")
    add("")
    add("    /// The values the specification marks as import-only.")
    add("    ///")
    add("    /// - Note: The specification marks no credit as import-only. The `CREDIT_*`")
    add("    ///   fields that carry credits are themselves import-only.")
    add("    public static let importOnlyMembers: Set<String> = []")
    add("")
    add("    /// The organization that runs the award program this credit counts toward.")
    add("    public var sponsor: String {")
    add("        Self.metadataByValue[description]?.sponsor ?? \"\"")
    add("    }")
    add("")
    add("    /// The award program this credit counts toward.")
    add("    public var award: String {")
    add("        Self.metadataByValue[description]?.award ?? \"\"")
    add("    }")
    add("")
    add("    /// The aspect of a QSO this credit is limited to, such as band or mode.")
    add("    ///")
    add("    /// - Note: `Mixed` means the credit is not limited to a single facet.")
    add("    public var facet: String {")
    add("        Self.metadataByValue[description]?.facet ?? \"\"")
    add("    }")
    add("")
    add("    /// The credit, in the canonical form the specification uses.")
    add("    public var description: String {")
    add("        switch self {")
    for member in members:
        add(f"        case .{member['case']}:")
        add(f'            "{member["value"]}"')
    add("        case let .unrecognized(raw):")
    add("            raw")
    add("        }")
    add("    }")
    add("")
    add("    private static let metadataByValue: [String: "
        "(sponsor: String, award: String, facet: String)] = [")
    for member in members:
        add(f'        "{member["value"]}": '
            f'("{member["sponsor"]}", "{member["award"]}", "{member["facet"]}"),')
    add("    ]")
    add("")
    add("    private static let membersByLowercasedValue: [String: " + t + "] = [")
    for member in members:
        add(f'        "{member["value"].lower()}": .{member["case"]},')
    add("    ]")
    add("")
    add("    /// Creates a value from its textual form.")
    add("    ///")
    add("    /// - Parameter rawValue: The credit, in any case.")
    add("    /// - Returns: The matching member, or `.unrecognized` when `rawValue` names")
    add("    ///   no credit the specification defines.")
    add("    public init(rawValue: some StringProtocol) {")
    add("        guard let member = Self.membersByLowercasedValue[rawValue.lowercased()] else {")
    add("            self = .unrecognized(rawValue.description)")
    add("")
    add("            return")
    add("        }")
    add("")
    add("        self = member")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, members


def region_literal(t, region):
    return (f'{t}(code: "{region["code"]}", dxccEntityCode: {lit(region["dxcc"])}, '
            f'name: "{region["name"]}", prefix: {lit(region["prefix"])}, '
            f'applicability: {lit(region["applicability"])})')


def lit(value):
    """Quote a specification value for Swift, or emit nil when it is absent.

    Specification text carries characters that are literal in HTML but not in
    Swift -- Russian Districts' sponsor is `Tambov award group ("TAG")` -- so
    quotes and backslashes are escaped rather than emitted raw.
    """
    if not value:
        return "nil"

    escaped = value.replace("\\", "\\\\").replace(chr(34), "\\" + chr(34))
    return chr(34) + escaped + chr(34)


def add_list(out, entries):
    """Add array-literal entries, separating every one but the last with a comma."""
    last = len(entries) - 1
    for index, entry in enumerate(entries):
        out.append("        " + entry + ("" if index == last else ","))


def emit_primary_subdivisions(outdir):
    """III.B.12, one table per DXCC entity.

    A code means nothing on its own: Quebec is QC inside Canada and nothing
    anywhere else, so the DXCC entity is part of the key rather than a filter.
    The file therefore keeps a single list and derives its indexes from it, which
    also keeps it to a third the size of repeating every entry in each index.
    """
    t = "ADIPrimaryAdministrativeSubdivision"
    rows = MODEL["primarySubdivisions"]
    out = []
    add = out.append

    add("/// A primary administrative subdivision of a DXCC entity, such as a province,")
    add("/// state, or oblast.")
    add("///")
    add("/// The specification defines these per DXCC entity in its section III.B.12, and")
    add("/// a code is only meaningful inside the entity that defines it. Look one up with")
    add("/// `init(code:dxccEntityCode:)` rather than treating the code as global.")
    add("///")
    add("/// - Note: Some entities group their codes under a district heading, such as")
    add("///   Austria's states under `Wien`, which is reported by `region`.")
    add("public struct " + t + ": Hashable, Sendable, CustomStringConvertible {")
    add("    /// The subdivision code, as the specification spells it.")
    add("    public let code: String")
    add("")
    add("    /// The subdivision's name.")
    add("    public let name: String")
    add("")
    add("    /// The DXCC entity that defines this subdivision.")
    add("    public let dxccEntityCode: String")
    add("")
    add("    /// The DXCC entity's name.")
    add("    public let dxccEntityName: String")
    add("")
    add("    /// The district or region this subdivision sits within, where the entity")
    add("    ///   groups its codes that way.")
    add("    ///")
    add("    /// - Note: `nil` where the specification lists the subdivision without a")
    add("    ///   grouping heading.")
    add("    public let region: String?")
    add("")
    add("    /// The oblast number, where the specification gives one.")
    add("    public let oblast: String?")
    add("")
    add("    /// The CQ zone or zones this subdivision lies in.")
    add("    public let cqZone: String?")
    add("")
    add("    /// The ITU zone or zones this subdivision lies in.")
    add("    public let ituZone: String?")
    add("")
    add("    /// Whether the specification has retired this subdivision.")
    add("    ///")
    add("    /// - Note: A retired subdivision is kept rather than dropped so a log that")
    add("    ///   used it still validates.")
    add("    public let isDeleted: Bool")
    add("")
    add("    /// Every primary administrative subdivision the specification defines.")
    add("    public static let allSubdivisions: [" + t + "] = [")

    add_list(out, [
        f'{t}(code: {lit(row["code"])}, name: {lit(row["name"])}, '
        f'dxccEntityCode: {lit(row["dxccEntityCode"])}, '
        f'dxccEntityName: {lit(row["dxccEntityName"])}, region: {lit(row["region"])}, '
        f'oblast: {lit(row["oblast"])}, cqZone: {lit(row["cqZone"])}, '
        f'ituZone: {lit(row["ituZone"])}, isDeleted: {str(row["deleted"]).lower()})'
        for row in rows
    ])

    add("    ]")
    add("")
    add("    private static let subdivisionsByKey: [String: [" + t + "]] = {")
    add("        var index = [String: [" + t + "]](minimumCapacity: Self.allSubdivisions.count)")
    add("        for subdivision in Self.allSubdivisions {")
    add('            index[Self.key(code: subdivision.code, dxccEntityCode: subdivision.dxccEntityCode), default: []].append(subdivision)')
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    private static let subdivisionsByDXCCEntity: [String: [" + t + "]] = {")
    add("        var index = [String: [" + t + "]](minimumCapacity: 66)")
    add("        for subdivision in Self.allSubdivisions {")
    add("            index[subdivision.dxccEntityCode, default: []].append(subdivision)")
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    /// The subdivision's code.")
    add("    public var description: String {")
    add("        code")
    add("    }")
    add("")
    add("    /// Creates a subdivision from its specification data.")
    add("    ///")
    add("    /// - Parameters:")
    for name in ("code", "name", "dxccEntityCode", "dxccEntityName", "region", "oblast",
                 "cqZone", "ituZone"):
        add(f"    ///   - {name}: The subdivision's {name}.")
    add("    ///   - isDeleted: Whether the specification has retired the subdivision.")
    add("    public init(")
    add("        code: String,")
    add("        name: String,")
    add("        dxccEntityCode: String,")
    add("        dxccEntityName: String,")
    add("        region: String? = nil,")
    add("        oblast: String? = nil,")
    add("        cqZone: String? = nil,")
    add("        ituZone: String? = nil,")
    add("        isDeleted: Bool = false")
    add("    ) {")
    add("        self.code = code")
    add("        self.name = name")
    add("        self.dxccEntityCode = dxccEntityCode")
    add("        self.dxccEntityName = dxccEntityName")
    add("        self.region = region")
    add("        self.oblast = oblast")
    add("        self.cqZone = cqZone")
    add("        self.ituZone = ituZone")
    add("        self.isDeleted = isDeleted")
    add("    }")
    add("")
    add("    /// Creates a subdivision by looking up its code within a DXCC entity.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The subdivision code, in any case.")
    add("    ///   - dxccEntityCode: The DXCC entity code that defines it.")
    add("    /// - Returns: The matching subdivision, or `nil` if the specification")
    add("    ///   defines no subdivision with that code in that entity.")
    add("    /// - Note: The DXCC entity is required because a code is reused across")
    add("    ///   entities and means something different in each. Where a code is reused")
    add("    ///   within one entity, this returns the first candidate in specification")
    add("    ///   order; see `subdivisions(code:dxccEntityCode:)` for all of them.")
    add("    public init?(code: some StringProtocol, dxccEntityCode: some StringProtocol) {")
    add("        guard let candidates = Self.subdivisionsByKey[")
    add("            Self.key(code: code, dxccEntityCode: dxccEntityCode)")
    add("        ], let subdivision = candidates.first else {")
    add("            return nil")
    add("        }")
    add("")
    add("        self = subdivision")
    add("    }")
    add("")
    add("    /// Returns every subdivision the specification defines with a code in a")
    add("    /// DXCC entity.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The subdivision code, in any case.")
    add("    ///   - dxccEntityCode: The DXCC entity code that defines it.")
    add("    /// - Returns: The matching subdivisions in specification order, which is empty")
    add("    ///   where the specification defines none.")
    add("    /// - Note: The specification reuses a code across a boundary change, naming")
    add("    ///   both the subdivision retired at a date and the one that replaced it --")
    add("    ///   `PM` in Asiatic Russia, for instance. Use this where that matters, and")
    add("    ///   `init(code:dxccEntityCode:)` where the first candidate will do.")
    add("    public static func subdivisions(code: some StringProtocol,")
    add("                                dxccEntityCode: some StringProtocol) -> [" + t + "] {")
    add("        Self.subdivisionsByKey[Self.key(code: code, dxccEntityCode: dxccEntityCode)] ?? []")
    add("    }")
    add("")
    add("    /// Returns every primary subdivision the specification defines in a DXCC")
    add("    /// entity.")
    add("    ///")
    add("    /// - Parameter dxccEntityCode: The DXCC entity code.")
    add("    /// - Returns: That entity's subdivisions, in specification order.")
    add("    public static func subdivisions(inDXCCEntity dxccEntityCode: some StringProtocol) -> ["
        + t + "] {")
    add("        Self.subdivisionsByDXCCEntity[String(dxccEntityCode)] ?? []")
    add("    }")
    add("")
    add("    private static func key(code: some StringProtocol,")
    add("                           dxccEntityCode: some StringProtocol) -> String {")
    add('        "\\(dxccEntityCode.uppercased())/\\(code.uppercased())"')
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, rows


def emit_secondary_schemes(outdir):
    """III.B.22 and III.B.23, which describe a scheme rather than list its values.

    Section III.B.23 names the single alternative enumeration NZ_Regions, which
    describes a scheme in the same terms as III.B.22, so both are emitted here
    rather than dropping the one row III.B.23 holds.
    """
    t = "ADISecondaryAdministrativeSubdivisionScheme"
    secondary = MODEL["secondarySubdivisions"]
    schemes = [{
        "name": row["scheme"],
        "dxccEntityCode": row["dxccEntityCode"],
        "dxccEntityName": row["dxccEntityName"],
        "count": row["count"],
        "award": row["award"],
        "subdivisionList": row["subdivisionList"],
        "awardSponsor": row["awardSponsor"],
        "codeFormat": row["codeFormat"],
    } for row in secondary["schemes"]] + [{
        "name": row["scheme"],
        "dxccEntityCode": row["dxccEntityCode"],
        "dxccEntityName": row["country"],
        "count": None,
        "award": row["award"],
        "subdivisionList": row["subdivisionEnumeration"],
        "awardSponsor": row["awardSponsor"],
        "codeFormat": row["codeFormat"],
    } for row in secondary["alternate"]]

    out = []
    add = out.append
    add("/// A scheme for naming secondary administrative subdivisions within a DXCC")
    add("/// entity, such as U.S. counties or Russian districts.")
    add("///")
    add("/// The specification describes these schemes in its sections III.B.22 and III.B.23")
    add("/// rather than listing their values, because each scheme's subdivisions are")
    add("/// published by the awarding body the scheme names. A scheme therefore says which")
    add("/// authority maintains the list and how a code is formatted, not what every code")
    add("/// is.")
    add("///")
    add("/// - Note: Section III.B.22.a does list its values, and is available as")
    add("///   `ADIAlaskaCounty`.")
    add("public struct " + t + ": Hashable, Sendable, CustomStringConvertible {")
    add("    /// The scheme's name, such as `U.S. Counties`.")
    add("    public let name: String")
    add("")
    add("    /// The DXCC entity this scheme applies within.")
    add("    public let dxccEntityCode: String")
    add("")
    add("    /// That DXCC entity's name.")
    add("    public let dxccEntityName: String")
    add("")
    add("    /// How many subdivisions the scheme defines, where the specification counts")
    add("    ///   them.")
    add("    public let count: String?")
    add("")
    add("    /// The award program the scheme serves.")
    add("    public let award: String?")
    add("")
    add("    /// The name of the list of subdivisions.")
    add("    public let subdivisionList: String?")
    add("")
    add("    /// The organisation that maintains the subdivision list.")
    add("    public let awardSponsor: String?")
    add("")
    add("    /// How a subdivision code is formatted within this scheme.")
    add("    public let codeFormat: String?")
    add("")
    add("    /// Every subdivision scheme the specification describes.")
    add("    public static let allSchemes: [" + t + "] = [")
    add_list(out, [
        f'{t}(name: {lit(scheme["name"])}, '
        f'dxccEntityCode: {lit(scheme["dxccEntityCode"])}, '
        f'dxccEntityName: {lit(scheme["dxccEntityName"])}, count: {lit(scheme["count"])}, '
        f'award: {lit(scheme["award"])}, '
        f'subdivisionList: {lit(scheme["subdivisionList"])}, '
        f'awardSponsor: {lit(scheme["awardSponsor"])}, '
        f'codeFormat: {lit(scheme["codeFormat"])})'
        for scheme in schemes
    ])
    add("    ]")
    add("")
    add("    private static let schemesByDXCCEntity: [String: [" + t + "]] = {")
    add("        var index = [String: [" + t + "]](minimumCapacity: Self.allSchemes.count)")
    add("        for scheme in Self.allSchemes {")
    add("            index[scheme.dxccEntityCode, default: []].append(scheme)")
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    /// The scheme's name.")
    add("    public var description: String {")
    add("        name")
    add("    }")
    add("")
    add("    /// Creates a subdivision scheme from its specification data.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - name: The scheme's name.")
    add("    ///   - dxccEntityCode: The DXCC entity the scheme applies within.")
    add("    ///   - dxccEntityName: That entity's name.")
    add("    ///   - count: How many subdivisions the scheme defines, if stated.")
    add("    ///   - award: The award program the scheme serves.")
    add("    ///   - subdivisionList: The name of the list of subdivisions.")
    add("    ///   - awardSponsor: The organisation maintaining the list.")
    add("    ///   - codeFormat: How a subdivision code is formatted.")
    add("    public init(")
    add("        name: String,")
    add("        dxccEntityCode: String,")
    add("        dxccEntityName: String,")
    add("        count: String? = nil,")
    add("        award: String? = nil,")
    add("        subdivisionList: String? = nil,")
    add("        awardSponsor: String? = nil,")
    add("        codeFormat: String? = nil")
    add("    ) {")
    add("        self.name = name")
    add("        self.dxccEntityCode = dxccEntityCode")
    add("        self.dxccEntityName = dxccEntityName")
    add("        self.count = count")
    add("        self.award = award")
    add("        self.subdivisionList = subdivisionList")
    add("        self.awardSponsor = awardSponsor")
    add("        self.codeFormat = codeFormat")
    add("    }")
    add("")
    add("    /// Returns every subdivision scheme that applies within a DXCC entity.")
    add("    ///")
    add("    /// - Parameter dxccEntityCode: The DXCC entity code.")
    add("    /// - Returns: That entity's schemes, in specification order.")
    add("    public static func schemes(inDXCCEntity dxccEntityCode: some StringProtocol) -> ["
        + t + "] {")
    add("        Self.schemesByDXCCEntity[String(dxccEntityCode)] ?? []")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, schemes


def emit_alaska_counties(outdir):
    """III.B.22.a, the one secondary subdivision scheme whose values are listed."""
    t = "ADIAlaskaCounty"
    rows = MODEL["secondarySubdivisions"]["alaskaCounties"]
    out = []
    add = out.append
    add("/// A borough or census area of Alaska.")
    add("///")
    add("/// Alaska is the one secondary administrative subdivision the specification lists")
    add("/// in full, in its section III.B.22.a, rather than leaving to an awarding body.")
    add("/// The `USACA_COUNTIES` field therefore validates against this list.")
    add("///")
    add("/// - Note: A county's code is the two-letter state abbreviation, a comma, and the")
    add("///   county name, such as `AK,Aleutians East`.")
    add("public struct " + t + ": Hashable, Sendable, CustomStringConvertible {")
    add("    /// The county's code, as the specification spells it.")
    add("    public let code: String")
    add("")
    add("    /// The county's name.")
    add("    public let name: String")
    add("")
    add("    /// The judicial district the county sits in.")
    add("    public let judicialDistrict: String")
    add("")
    add("    /// Whether the specification has retired this county.")
    add("    ///")
    add("    /// - Note: A retired county is kept rather than dropped so a log that used it")
    add("    ///   still validates.")
    add("    public let isDeleted: Bool")
    add("")
    add("    /// Every Alaska county the specification defines.")
    add("    public static let allCounties: [" + t + "] = [")
    add_list(out, [
        f'{t}(code: {lit(row["code"])}, name: {lit(row["name"])}, '
        f'judicialDistrict: {lit(row["judicialDistrict"])}, '
        f'isDeleted: {str(row["deleted"]).lower()})'
        for row in rows
    ])
    add("    ]")
    add("")
    add("    private static let countiesByCode: [String: " + t + "] = {")
    add("        var index = [String: " + t + "](minimumCapacity: Self.allCounties.count)")
    add("        for county in Self.allCounties {")
    add("            index[county.code.uppercased()] = county")
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    /// The county's code.")
    add("    public var description: String {")
    add("        code")
    add("    }")
    add("")
    add("    /// Creates a county from its specification data.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The county's code.")
    add("    ///   - name: The county's name.")
    add("    ///   - judicialDistrict: The judicial district it sits in.")
    add("    ///   - isDeleted: Whether the specification has retired the county.")
    add("    public init(")
    add("        code: String,")
    add("        name: String,")
    add("        judicialDistrict: String,")
    add("        isDeleted: Bool = false")
    add("    ) {")
    add("        self.code = code")
    add("        self.name = name")
    add("        self.judicialDistrict = judicialDistrict")
    add("        self.isDeleted = isDeleted")
    add("    }")
    add("")
    add("    /// Creates a county by looking up its code.")
    add("    ///")
    add("    /// - Parameter code: The county code, in any case.")
    add("    /// - Returns: The matching county, or `nil` if the specification defines no")
    add("    ///   county with that code.")
    add("    public init?(code: some StringProtocol) {")
    add("        guard let county = Self.countiesByCode[code.uppercased()] else {")
    add("            return nil")
    add("        }")
    add("")
    add("        self = county")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, rows


def emit_nz_regions(outdir):
    """III.B.23.a, the subdivisions behind the alternative CNTY_ALT enumeration."""
    t = "ADINewZealandRegion"
    rows = MODEL["secondarySubdivisions"]["nzRegions"]
    out = []
    add = out.append
    add("/// A region of New Zealand, and the districts within it.")
    add("///")
    add("/// The specification defines these in its section III.B.23.a as the alternative")
    add("/// subdivision enumeration `NZ_Regions`, which the `CNTY_ALT` field uses for New")
    add("/// Zealand instead of an awarding body's list.")
    add("///")
    add("/// - Note: A code is the enumeration name, a colon, the region and district joined")
    add("///   by a slash, such as `NZ_Regions:Northland/Far North`.")
    add("public struct " + t + ": Hashable, Sendable, CustomStringConvertible {")
    add("    /// The subdivision's code, as the specification spells it.")
    add("    public let code: String")
    add("")
    add("    /// The region this district sits in.")
    add("    public let region: String")
    add("")
    add("    /// The district within the region.")
    add("    public let district: String")
    add("")
    add("    /// Every New Zealand region and district the specification defines.")
    add("    public static let allRegions: [" + t + "] = [")
    add_list(out, [
        f'{t}(code: {lit(row["code"])}, region: {lit(row["region"])}, '
        f'district: {lit(row["district"])})'
        for row in rows
    ])
    add("    ]")
    add("")
    add("    private static let regionsByCode: [String: " + t + "] = {")
    add("        var index = [String: " + t + "](minimumCapacity: Self.allRegions.count)")
    add("        for region in Self.allRegions {")
    add("            index[region.code.uppercased()] = region")
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    private static let regionsByRegion: [String: [" + t + "]] = {")
    add("        var index = [String: [" + t + "]](minimumCapacity: 16)")
    add("        for region in Self.allRegions {")
    add("            index[region.region.lowercased(), default: []].append(region)")
    add("        }")
    add("")
    add("        return index")
    add("    }()")
    add("")
    add("    /// The subdivision's code.")
    add("    public var description: String {")
    add("        code")
    add("    }")
    add("")
    add("    /// Creates a region from its specification data.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The subdivision's code.")
    add("    ///   - region: The region this district sits in.")
    add("    ///   - district: The district within the region.")
    add("    public init(code: String, region: String, district: String) {")
    add("        self.code = code")
    add("        self.region = region")
    add("        self.district = district")
    add("    }")
    add("")
    add("    /// Creates a region by looking up its code.")
    add("    ///")
    add("    /// - Parameter code: The subdivision code, in any case.")
    add("    /// - Returns: The matching region and district, or `nil` if the specification")
    add("    ///   defines none with that code.")
    add("    public init?(code: some StringProtocol) {")
    add("        guard let region = Self.regionsByCode[code.uppercased()] else {")
    add("            return nil")
    add("        }")
    add("")
    add("        self = region")
    add("    }")
    add("")
    add("    /// Returns every district within a region.")
    add("    ///")
    add("    /// - Parameter region: The region's name, in any case.")
    add("    /// - Returns: That region's districts, in specification order.")
    add("    public static func districts(inRegion region: some StringProtocol) -> ["
        + t + "] {")
    add("        Self.regionsByRegion[region.lowercased()] ?? []")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, rows


def emit_region(outdir):
    t = "ADIRegion"
    rows = [r for r in rows_of("III.B.21. Region Enumeration") if r and r[0]]
    regions = []
    for row in rows:
        def cell(index):
            value = collapse(row[index]) if len(row) > index else ""
            return value or None
        regions.append({
            "code": row[0].strip(),
            "dxcc": cell(1),
            "name": cell(2),
            "prefix": cell(3),
            "applicability": cell(4),
        })

    t = "ADIRegion"
    out = []
    add = out.append
    add("/// A region that a QSO can belong to for award purposes.")
    add("///")
    add("/// The specification defines a small, closed set of region entity codes. Each")
    add("/// region either applies within one DXCC entity or, in the case of `NONE`,")
    add("/// stands for a station that is in no applicable region at all.")
    add("///")
    add("/// - Note: See the specification's section III.B for the authoritative list.")
    add(f"public struct {t}: Hashable, Sendable, CustomStringConvertible {{")
    add("    /// The region entity code the specification assigns this region.")
    add("    public let code: String")
    add("")
    add("    /// The DXCC entity this region applies within.")
    add("    ///")
    add("    /// - Note: `nil` for a region that applies in no single entity.")
    add("    public let dxccEntityCode: String?")
    add("")
    add("    /// The region's name.")
    add("    public let name: String")
    add("")
    add("    /// The station prefix associated with the region, where the specification")
    add("    ///   gives one.")
    add("    public let prefix: String?")
    add("")
    add("    /// The award programs the region applies to, where the specification")
    add("    ///   limits it.")
    add("    public let applicability: String?")
    add("")
    add(f"    /// Every region the specification defines, in specification order.")
    add(f"    public static let allRegions: [{t}] = [")
    for region in regions:
        add(f"        {region_literal(t, region)},")
    add("    ]")
    add("")
    add("    private static let regionsByCode: [String: [String: " + t + "]] = [")
    by_code = {}
    for region in regions:
        by_code.setdefault(region["code"], []).append(region)
    emitted = set()
    for region in regions:
        code = region["code"]
        if code in emitted:
            continue
        emitted.add(code)
        add(f'        "{code}": [')
        for region in by_code[code]:
            add(f'            "{region["dxcc"] or ""}": {region_literal(t, region)},')
        add("        ],")
    add("    ]")
    add("")
    add("    private static let regionsByDXCCEntity: [String: [" + t + "]] = [")
    grouped = {}
    for region in regions:
        if region["dxcc"]:
            grouped.setdefault(region["dxcc"], []).append(region)
    for dxcc in sorted(grouped, key=int):
        add(f'        "{dxcc}": [')
        for region in grouped[dxcc]:
            add(f"            {region_literal(t, region)},")
        add("        ],")
    add("    ]")
    add("")
    add("    /// The region entity code.")
    add("    public var description: String {")
    add("        code")
    add("    }")
    add("")
    add("    /// Creates a region from its specification data.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The region entity code.")
    add("    ///   - dxccEntityCode: The DXCC entity the region applies within.")
    add("    ///   - name: The region's name.")
    add("    ///   - prefix: The associated station prefix, if any.")
    add("    ///   - applicability: The award programs the region applies to, if limited.")
    add("    public init(")
    add("        code: String,")
    add("        dxccEntityCode: String? = nil,")
    add("        name: String,")
    add("        prefix: String? = nil,")
    add("        applicability: String? = nil")
    add("    ) {")
    add("        self.code = code")
    add("        self.dxccEntityCode = dxccEntityCode")
    add("        self.name = name")
    add("        self.prefix = prefix")
    add("        self.applicability = applicability")
    add("    }")
    add("")
    add("    /// Creates a region by looking up its region entity code and DXCC entity.")
    add("    ///")
    add("    /// - Parameters:")
    add("    ///   - code: The region entity code, in any case.")
    add("    ///   - dxccEntityCode: The DXCC entity code the region applies within.")
    add("    /// - Returns: The matching region, or `nil` if the specification defines no")
    add("    ///   region with that code in that DXCC entity.")
    add("    /// - Note: The specification reuses a region entity code across DXCC")
    add("    ///   entities, so the DXCC entity code is required to identify one region.")
    add("    public init?(code: some StringProtocol, dxccEntityCode: String?) {")
    add("        guard let byEntity = Self.regionsByCode[code.uppercased()] else {")
    add("            return nil")
    add("        }")
    add("")
    add("        guard let region = byEntity[dxccEntityCode ?? \"\"] else {")
    add("            return nil")
    add("        }")
    add("")
    add("        self = region")
    add("    }")
    add("")
    add("    /// Returns every region the specification defines within a DXCC entity.")
    add("    ///")
    add("    /// - Parameter dxccEntityCode: The DXCC entity code.")
    add("    /// - Returns: The regions that apply within that entity, in specification")
    add("    ///   order.")
    add("    public static func regions(inDXCCEntity dxccEntityCode: String) -> [" + t + "] {")
    add("        Self.regionsByDXCCEntity[dxccEntityCode] ?? []")
    add("    }")
    add("}")
    add("")
    write_source(outdir, t, out)
    return t, regions


main()
