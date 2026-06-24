#import "../main.typ": *

// definition as modpattern was previously (version 0.1.*) defined
#let old-modpattern(size, body, dx: 0pt, dy: 0pt, background: none) = tiling(
  size: size,
  {
    if background != none {
      place(box(width: 100%, height: 100%, fill: background))
    }
    move(dx: -size.at(0) + dx, dy: -size.at(1) + dy, grid(
      columns: 3*(size.at(0),),
      rows: 3*(size.at(1),),
      body, body, body,
      body, body, body,
      body, body, body
    ))
  }
)

#set page(height: auto, width: auto, margin: 10pt)

#let size = (80pt, 40pt)
#let v = {
  place(rect(width: size.first(), height: size.last(), stroke: (dash: "dashed", paint: red)))
  circle(stroke: 5pt, radius: 15pt)
}
#let rect(x) = std.rect(width: 120pt, height: 50pt, fill: x)

#table(
  columns: 4,
  table.header([], [0.1.0], [0.2.0], [tiling]),
  [unmodified],
  rect(old-modpattern(size, v)),
  rect(modpattern(size: size, v)),
  rect(tiling(size: size, v)),
  [small offset],
  rect(old-modpattern(size, v, dx: 10pt)),
  rect(modpattern(size: size, v, offset: (10pt, 0pt))),
  rect(tiling(size: size, v, offset: (10pt, 0pt))),
  [offset by size],
  rect(old-modpattern(size, v, dx: 80pt)),
  rect(modpattern(size: size, v, offset: (80pt, 0pt))),
  rect(tiling(size: size, v, offset: (80pt, 0pt))),
  [offset by twice size],
  rect(old-modpattern(size, v, dx: 160pt)),
  rect(modpattern(size: size, v, offset: (160pt, 0pt))),
  rect(tiling(size: size, v, offset: (160pt, 0pt))),
  [spacing],
  none,
  rect(modpattern(size: size, v, spacing: (10pt, 0pt))),
  rect(tiling(size: size, v, spacing: (10pt, 0pt))),
  [negative spacing],
  none,
  rect(modpattern(size: size, v, spacing: (-10pt, 0pt))),
  rect(tiling(size: size, v, spacing: (-10pt, 0pt))),
  [spacing + offset],
  none,
  rect(modpattern(size: size, v, spacing: (-10pt, 0pt), offset: (10pt, 0pt))),
  rect(tiling(size: size, v, spacing: (-10pt, 0pt), offset: (10pt, 0pt))),
  [big negative spacing],
  none,
  rect(modpattern(size: size, v, spacing: (-60pt, 0pt))),
  rect(tiling(size: size, v, spacing: (-60pt, 0pt))),
  [relative: self],
  none,
  rect(modpattern(size: size, v, relative: "self")),
  rect(tiling(size: size, v, relative: "self")),
  table.cell(rowspan: 2)[relative: parent],
  none,
  rect(modpattern(size: size, v, relative: "parent")),
  rect(tiling(size: size, v, relative: "parent")),
  none,
  rect(modpattern(size: size, v, relative: "parent")),
  rect(tiling(size: size, v, relative: "parent")),
  table.cell(rowspan: 2)[offset &\ relative: parent],
  none,
  rect(modpattern(size: size, v, relative: "parent", offset: (0pt, 10pt))),
  rect(tiling(size: size, v, relative: "parent", offset: (0pt, 10pt))),
  none,
  rect(modpattern(size: size, v, relative: "parent", offset: (0pt, 10pt))),
  rect(tiling(size: size, v, relative: "parent", offset: (0pt, 10pt))),
  table.cell(rowspan: 2)[offset &\ spacing &\ relative: parent],
  none,
  rect(modpattern(size: size, v, relative: "parent", offset: (0pt, 10pt), spacing: (-10pt, 0pt))),
  rect(tiling(size: size, v, relative: "parent", offset: (0pt, 10pt), spacing: (-10pt, 0pt))),
  none,
  rect(modpattern(size: size, v, relative: "parent", offset: (0pt, 10pt), spacing: (-10pt, 0pt))),
  rect(tiling(size: size, v, relative: "parent", offset: (0pt, 10pt), spacing: (-10pt, 0pt))),
)