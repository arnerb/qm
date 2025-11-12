// templates/sop.typ
// Document class: standardized A4 layout, header/footer, numbering, and TOC.
#let sop(
title: "",
id: "",
rev: "",
owner: "",
approver: "",
date: "",
body,
) = {
// Page + typography
set page(size: "a4", margin: 22mm)
set text(size: 10pt)
// Example fonts; swap to your corporate fonts if available on CI/locally.
set text(font: "Inter")
set heading(numbering: "1.1", outliner: none)


// Header (first page)
v(6pt)
align(left)[
strong(#title)
small(\[#id\] Rev. #rev • #date)\
small(Owner: #owner • Approver: #approver)
]
line(length: 100%)
v(6pt)


// Auto TOC
heading(level: 1)[Table of Contents]
toc(indent: 1em)
pagebreak()


// Body content
#body


// Footer
show: page.with(
header: none,
footer: align(center)[small(#[page()] / #[pages()])],
)
}
