// templates/render-md.typ
// Parse Markdown, read metadata (YAML front matter), and wrap with sop.typ.
#import "sop.typ": sop
#import "@preview/markdown:0.4.0": md


// CLI-driven input: typst compile templates/render-md.typ output.pdf -i path=content/file.md
#let path = sys.inputs.path
#let raw = read(path)
#let parsed = md.parse(raw)


// Pull front-matter keys if present (fallbacks otherwise)
#let meta = parsed.metadata
#let get(key, default) = if meta.contains(key) { meta.at(key).to-str() } else { default }


#show: sop.with(
title: get("title", "Untitled"),
id: get("id", ""),
rev: get("rev", ""),
owner: get("owner", ""),
approver: get("approver", ""),
date: get("date", ""),
)


// Render the Markdown body
#md.render(parsed.body)
