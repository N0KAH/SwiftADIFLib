#!/usr/bin/env python3
"""Generate Swift reference sources for the ADIF specification's enumerations.

Reads spec_model.json, produced by extract_spec.py from the specification HTML,
and emits one Swift file per enumeration into the Records directory. Case names
are chosen for readability rather than mechanically: the specification's own
meaning column names many values far better than their one- or two-letter codes.

Usage:
    python3 Scripts/generate_reference_types.py [path/to/spec_model.json]

Run extract_spec.py first; every count this script reports is a check against the
specification rather than a description of the generated code.
"""
import json, re, os, sys, keyword, hashlib

HERE = os.path.dirname(os.path.abspath(__file__))
MODEL = json.load(open(os.path.join(HERE, "spec_model.json")))
RECORDS = os.path.join(os.path.dirname(HERE), "Sources", "SwiftADIFLib", "Records")

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

    open(os.path.join(outdir, t + ".swift"), "w").write("\n".join(out))
    return t, members


def main():
    outdir = sys.argv[1] if len(sys.argv) > 1 else RECORDS
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
    json.dump(model, open(os.path.join(HERE, "enum_model.json"), "w"), indent=1)
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
    open(os.path.join(outdir, t + ".swift"), "w").write("\n".join(out))
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
    open(os.path.join(outdir, t + ".swift"), "w").write("\n".join(out))
    return t, members


def region_literal(t, region):
    def lit(value):
        return "nil" if not value else chr(34) + value + chr(34)
    return (f'{t}(code: "{region["code"]}", dxccEntityCode: {lit(region["dxcc"])}, '
            f'name: "{region["name"]}", prefix: {lit(region["prefix"])}, '
            f'applicability: {lit(region["applicability"])})')


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
    open(os.path.join(outdir, t + ".swift"), "w").write("\n".join(out))
    return t, regions


main()
