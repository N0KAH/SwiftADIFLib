#!/usr/bin/env python3
"""Extract the ADIF specification's reference tables into a JSON model.

The specification is a single HTML document whose reference data lives in tables.
Reading those tables correctly matters: several of them use `rowspan` and
`colspan` to share a cell across logical rows, and the meaning of a column
changes from table to table. A reader that ignores spans silently shifts every
continuation row one column to the left, which is how a previous version of this
script produced an `ADISubmode` that contained QSO field names.

Usage:
    python3 Scripts/extract_spec.py [path/to/spec.htm] [path/to/spec_model.json]

The specification document is published at https://adif.org/adif . Neither the
document nor the model this script produces is committed; see Scripts/.gitignore.

Every table this script reads is listed in MANIFEST with the number of data rows
the specification is expected to hold, and the script fails loudly when the
document no longer matches. That way a specification release surfaces as a clear
"expected N rows, found M" error instead of as quietly wrong generated Swift.
"""

import json
import os
import re
import sys

# Importing adif_table would otherwise leave a __pycache__ directory inside the
# package Xcode has open, whose churn upsets the file watcher.
sys.dont_write_bytecode = True

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

# Section key, HTML table index, expected data row count, expected first columns.
MANIFEST = [
    ("III.B.1. Ant Path Enumeration", 4, 4, ["Abbreviation", "Meaning"]),
    ("III.B.2. ARRL Section Enumeration", 5, 90, ["Abbreviation", "Section Name"]),
    ("III.B.3. Award Enumeration (import-only)", 6, 29, ["Award"]),
    ("III.B.4. Band Enumeration", 7, 33, ["Band", "Lower Freq (MHz)"]),
    ("III.B.5. Contest ID Enumeration", 8, 256, ["Contest-ID", "Description"]),
    ("III.B.6. Continent Enumeration", 9, 7, ["Abbreviation", "Continent"]),
    ("III.B.7. Credit Enumeration", 10, 71, ["Credit For", "Sponsor"]),
    ("III.B.8. DXCC Entity Code Enumeration", 11, 403, ["Entity Code", "Entity Name"]),
    ("III.B.9. EQSL_AG Enumeration", 12, 3, ["Status", "Description"]),
    ("III.B.10. Mode Enumeration", 13, 91, ["Mode", "Submodes"]),
    ("III.B.11. Morse Key Type Enumeration", 14, 7, ["Abbreviation", "Meaning"]),
    ("III.B.13. Propagation Mode Enumeration", 81, 20, ["Enumeration", "Description"]),
    ("III.B.14. QSL Medium Enumeration", 82, 3, ["Medium", "Description"]),
    ("III.B.15. QSL Rcvd Enumeration", 83, 5, ["Status", "Meaning"]),
    ("III.B.16. QSL Sent Enumeration", 84, 5, ["Status", "Meaning"]),
    ("III.B.17. QSL Via Enumeration", 85, 4, ["Via", "Description"]),
    ("III.B.18. QSO Complete Enumeration", 86, 4, ["Abbreviation", "Meaning"]),
    ("III.B.19. QSO Download Status Enumeration", 87, 3, ["Status", "Description"]),
    ("III.B.20. QSO Upload Status Enumeration", 88, 3, ["Status", "Description"]),
    ("III.B.21. Region Enumeration", 89, 10, ["Region Entity Code", "DXCC Entity Code"]),
    ("III.B.24. Sponsored Award Enumeration", 94, 11, ["Sponsor", "Sponsoring Organization"]),
    ("III.B.25. Submode Enumeration", 95, 187, ["Submode", "Mode"]),
]

# Section III.B.12 is one table per DXCC entity rather than a single table, and
# these tables are contiguous, so it is addressed as a range.
PRIMARY_RANGE = (15, 80)

# Tables that describe secondary subdivisions rather than list their values.
ALASKA_COUNTIES = 91
SECONDARY_SCHEMES = 90
SECONDARY_ALT = 92
NZ_REGIONS = 93

HEADER_FIELDS = 96
QSO_FIELDS = 97

# Row counts for the tables that are not simple enumerations of values. These are
# checked in main() for the same reason MANIFEST is: a specification release that
# adds or removes a subdivision should stop here rather than change the generated
# Swift without anyone noticing.
EXPECTED = {
    "primarySubdivisions": 1965,
    "secondarySchemes": 18,
    "alaskaCounties": 58,
    "alternateSchemes": 1,
    "nzRegions": 73,
    "headerFields": 5,
    "qsoFields": 181,
}

COUNTRY_HEADING = re.compile(r"^Enumeration for Country Code (\d+) \((.*)\)$")
DELETED = "deleted"


def fail(message):
    raise SystemExit(f"extract_spec: {message}")


def read_tables(path):
    from adif_table import read

    return read(path)


def enumeration(tables, key, index, expected, header):
    rows = tables[index]
    if [c.strip() for c in rows[0]][:len(header)] != header:
        fail(f"{key}: table {index} begins {rows[0][:3]!r}, expected {header!r}")

    data = rows[1:]
    if len(data) != expected:
        fail(f"{key}: expected {expected} data rows in table {index}, found {len(data)}. "
             "The specification has probably been revised; update MANIFEST.")

    return {"header": [c.strip() for c in rows[0]], "rows": [[c.strip() for c in r] for r in data]}


def primary_subdivisions(tables):
    """Read III.B.12, one table per DXCC entity.

    Each table opens with a heading naming the DXCC entity and a column header
    row. A few entities -- Slovakia, for one -- group their codes under district
    sub-headings, which arrive as a row whose only filled column is the first.
    """
    subdivisions = []
    first, last = PRIMARY_RANGE

    for index in range(first, last + 1):
        rows = tables[index]
        heading = COUNTRY_HEADING.match(rows[0][0].strip())
        if not heading:
            fail(f"table {index}: expected a DXCC entity heading, found {rows[0][0]!r}")

        code, entity = heading.group(1), heading.group(2)
        columns = [c.strip() for c in rows[1]]
        region = None

        for row in rows[2:]:
            cells = [c.strip() for c in row]
            name = cells[1] if len(cells) > 1 else ""
            if not cells[0]:
                continue
            if cells[0] == name:
                # A district heading spans both columns and holds the same text
                # in each, where a real row's code and name always differ. The
                # specification groups Slovakia's codes this way.
                region = cells[0]
                continue

            subdivisions.append({
                "dxccEntityCode": code,
                "dxccEntityName": entity,
                "region": region,
                "code": cells[0],
                "name": name,
                "oblast": column(cells, columns, "Oblast #"),
                "cqZone": column(cells, columns, "CQ Zone"),
                "ituZone": column(cells, columns, "ITU Zone"),
                "deleted": bool(column(cells, columns, DELETED)),
            })

    return subdivisions


def column(cells, columns, label):
    """Read a named column, ignoring case.

    The specification is inconsistent about capitals -- 'Deleted' in the Alaska
    and Aland tables -- so matching exactly would silently leave every deletion
    flag false.
    """
    for index, name in enumerate(columns):
        if name.strip().lower() == label.lower():
            return cells[index] if index < len(cells) else ""
    return None


def secondary_schemes(tables):
    """Read III.B.22, which describes a subdivision scheme per DXCC entity.

    The scheme name is shared down the group of DXCC entities it applies to, so
    each row after the column headings is one scheme within one entity.
    """
    rows = tables[SECONDARY_SCHEMES]
    columns = [c.strip() for c in rows[0]]
    schemes = []

    for row in rows[1:]:
        cells = [c.strip() for c in row]
        if not cells[0]:
            continue

        schemes.append({
            "scheme": cells[0],
            "dxccEntityCode": column(cells, columns, "Country Code"),
            "dxccEntityName": column(cells, columns, "DXCC Entity"),
            "count": column(cells, columns, "Number of secondary subdivisions"),
            "award": column(cells, columns, "Award"),
            "subdivisionList": column(cells, columns, "Subdivision List"),
            "awardSponsor": column(cells, columns, "Award Sponsor"),
            "codeFormat": column(cells, columns, "Sponsor Defined Code Format"),
            "examples": column(cells, columns, "Examples"),
        })

    return schemes


def secondary_alt(tables):
    rows = tables[SECONDARY_ALT]
    columns = [c.strip() for c in rows[0]]
    entries = []

    for row in rows[1:]:
        cells = [c.strip() for c in row]
        if not cells[0]:
            continue

        entries.append({
            "scheme": cells[0],
            "country": column(cells, columns, "Country Code"),
            "dxccEntityCode": column(cells, columns, "DXCC Entity"),
            "award": column(cells, columns, "Award"),
            "subdivisionEnumeration": column(cells, columns, "Subdivision Enumeration"),
            "awardSponsor": column(cells, columns, "Award Sponsor"),
            "codeFormat": column(cells, columns, "Examples"),
        })

    return entries


def alaska_counties(tables):
    rows = tables[ALASKA_COUNTIES]
    columns = [c.strip() for c in rows[1]]
    counties = []

    for row in rows[2:]:
        cells = [c.strip() for c in row]
        if not cells[0]:
            continue

        counties.append({
            "code": cells[0],
            "name": cells[1] if len(cells) > 1 else "",
            "judicialDistrict": column(cells, columns, "Alaska Judicial District"),
            "deleted": bool(column(cells, columns, DELETED)),
        })

    return counties


def nz_regions(tables):
    rows = tables[NZ_REGIONS]
    columns = [c.strip() for c in rows[0]]
    entries = []

    for row in rows[1:]:
        cells = [c.strip() for c in row]
        if not cells[0]:
            continue

        entries.append({
            "code": cells[0],
            "region": column(cells, columns, "Region"),
            "district": column(cells, columns, "District"),
        })

    return entries


def fields(tables, index):
    return [
        {
            "name": row[0].strip(),
            "type": row[1].strip(),
            "enumeration": row[2].strip(),
            "comment": row[3].strip() if len(row) > 3 else "",
        }
        for row in tables[index][1:]
        if row and row[0].strip()
    ]


def cross_check(model):
    """Refuse an extraction where a table's values have leaked into a neighbour.

    Reading rows as a flat list once let the QSO field table that follows Submode
    bleed into it, and `ADISubmode` was generated with 186 QSO field names such
    as `CALL` and `BAND` among its cases. Every table is now addressed on its own,
    and this check is the backstop: the field tables are the only ones carrying a
    Data Type column, so an enumeration row that has one did not come from its own
    table. Comparing names alone would not do -- `DXCC`, `IOTA` and `STX` are each
    both a field name and a legitimate enumeration value.
    """
    types = {f["type"] for f in model["fields"]["header"] + model["fields"]["qso"]}
    leaks = []

    for key, enumeration in model["enumerations"].items():
        for row in enumeration["rows"]:
            if len(row) > 1 and row[1] in types:
                leaks.append(f"{key}: {row[0]!r} has a Data Type, so it is a field row")

    if leaks:
        fail("enumerations hold field rows, so a table has bled into a neighbour:\n  "
             + "\n  ".join(leaks))


def count_check(model):
    """Refuse an extraction whose table sizes no longer match the specification.

    MANIFEST covers the enumerations; these are the tables that describe
    administrative subdivisions and fields instead. A specification release that
    adds a subdivision changes the count, and that should stop here rather than
    silently change generated Swift.
    """
    secondary = model["secondarySubdivisions"]
    found = {
        "primarySubdivisions": len(model["primarySubdivisions"]),
        "secondarySchemes": len(secondary["schemes"]),
        "alaskaCounties": len(secondary["alaskaCounties"]),
        "alternateSchemes": len(secondary["alternate"]),
        "nzRegions": len(secondary["nzRegions"]),
        "headerFields": len(model["fields"]["header"]),
        "qsoFields": len(model["fields"]["qso"]),
    }

    for name, expected in EXPECTED.items():
        if found[name] != expected:
            fail(f"{name}: expected {expected} rows, found {found[name]}. "
                 "The specification has probably been revised; update EXPECTED.")


def main():
    source = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "spec.htm")
    target = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, "spec_model.json")

    if not os.path.exists(source):
        fail(f"{source} not found. Download the specification from https://adif.org/adif .")

    tables = read_tables(source)
    model = {
        "enumerations": {
            key: enumeration(tables, key, index, expected, header)
            for key, index, expected, header in MANIFEST
        },
        "primarySubdivisions": primary_subdivisions(tables),
        "secondarySubdivisions": {
            "schemes": secondary_schemes(tables),
            "alaskaCounties": alaska_counties(tables),
            "alternate": secondary_alt(tables),
            "nzRegions": nz_regions(tables),
        },
        "fields": {
            "header": fields(tables, HEADER_FIELDS),
            "qso": fields(tables, QSO_FIELDS),
        },
    }

    cross_check(model)
    count_check(model)

    text = json.dumps(model, indent=1, ensure_ascii=False)

    # Leave the model alone when nothing changed, so re-running this over the same
    # specification does not make Xcode re-index the package for no reason.
    if not os.path.exists(target) or open(target).read() != text:
        with open(target, "w") as handle:
            handle.write(text)
        wrote = f"wrote {target}"
    else:
        wrote = f"{target} unchanged"

    enumerations = model["enumerations"]
    print(f"{len(enumerations)} enumerations, "
          f"{sum(len(e['rows']) for e in enumerations.values())} values")
    print(f"{len(model['primarySubdivisions'])} primary administrative subdivisions")
    secondary = model["secondarySubdivisions"]
    print(f"{len(secondary['schemes'])} secondary schemes, "
          f"{len(secondary['alaskaCounties'])} Alaska counties, "
          f"{len(secondary['alternate'])} alternate schemes, "
          f"{len(secondary['nzRegions'])} NZ regions")
    print(f"{len(model['fields']['header'])} header fields, "
          f"{len(model['fields']['qso'])} QSO fields")
    print(wrote)


if __name__ == "__main__":
    main()