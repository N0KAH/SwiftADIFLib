"""A rowspan/colspan aware reader for the tables in the ADIF specification.

The specification shares cells across logical rows -- one `<td rowspan="4">`
holds the DXCC entity code for a whole group of schemes, and `<th colspan="2">`
marks a district heading -- so cells have to be laid out on a grid before the
rows mean anything. Reading rows as a flat list of cells shifts every
continuation row one column to the left.
"""

import re
from html.parser import HTMLParser


class Tables(HTMLParser):
    """Collects every top-level HTML table as a rectangular grid of text."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.tables = []
        self._depth = 0
        self._row = None
        self._cell = None
        self._span = (1, 1)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)

        if tag == "table":
            if self._depth == 0:
                self._rows = []
            self._depth += 1
        elif tag == "tr" and self._depth == 1:
            self._row = []
        elif tag in ("td", "th") and self._depth == 1:
            self._cell = []
            self._span = _span(attrs)

    def handle_endtag(self, tag):
        if tag in ("td", "th") and self._cell is not None:
            self._row.append((collapse("".join(self._cell)), *self._span))
            self._cell = None
        elif tag == "tr" and self._row is not None:
            self._rows.append(self._row)
            self._row = None
        elif tag == "table":
            self._depth -= 1
            if self._depth == 0:
                self.tables.append(grid(self._rows))

    def handle_data(self, data):
        if self._cell is not None:
            self._cell.append(data)


def _span(attrs):
    def count(name):
        try:
            return max(1, int(attrs.get(name, 1)))
        except (TypeError, ValueError):
            return 1

    return count("colspan"), count("rowspan")


def collapse(text):
    """Reduce a cell's text to single spaces, treating no-break space as one."""
    return re.sub(r"\s+", " ", text.replace("\xa0", " ")).strip()


def grid(rows):
    """Lay parsed cells out on a rectangle, honouring colspan and rowspan."""
    cells = {}

    for row_index, row in enumerate(rows):
        column = 0
        for text, colspan, rowspan in row:
            while (row_index, column) in cells:
                column += 1
            for dy in range(rowspan):
                for dx in range(colspan):
                    cells[(row_index + dy, column + dx)] = text
            column += colspan

    width = 0
    for _, column in cells:
        width = max(width, column + 1)

    return [
        [cells.get((row_index, column), "") for column in range(width)]
        for row_index in range(len(rows))
    ]


def read(path):
    """Return every top-level table in `path` as a rectangular grid."""
    parser = Tables()
    with open(path, encoding="utf-8", errors="replace") as handle:
        parser.feed(handle.read())

    return parser.tables