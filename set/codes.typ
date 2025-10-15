#import "@preview/pleast:0.3.0": plist
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *

#let codes(doc) = {
  set raw(
    theme: "tokyo-night.tmTheme"
  )
  show raw: set text(fill: rgb("#a9b1d6"))
  show raw.where(block: false): box.with(
    fill: rgb("#1d2433"),
    inset: (x: .3em, y: 0em),
    outset: (y: .3em),
    stroke: gray + .4pt,
    radius: .5em,
  )
  show: codly-init.with()
  // #show figure.where(kind: "__codly-raw-line"): set text(fill: rgb("#a9b1d6"))
  // #show figure.where(kind: "codly-line"): set text(fill: rgb("#a9b1d6"))
  codly(
    languages: codly-languages,
    zebra-fill: none,
    fill: rgb("#1d2433"),
    radius: .5em,
    stroke: gray + .4pt,
    lang-outset: (x: .2em, y: .1em),
    lang-radius: .4em,
    number-align: right + horizon,
    number-format: (number) => {
      let sample = `999`
      let w = measure(sample).width
      box(width: w)[#text(fill: white)[#number]]
    },
    header-transform: (hdr) => {
      text(size: 0.7em, weight: "regular", fill: white)[#hdr#hide("fgFG")]
    },
    header-repeat: true,
    header-cell-args: (align: left, fill: rgb("#3d308a")),
    lang-format: (name, icon, color) => {
      let radius = 0.32em
      let padding = 0.32em
      let lang_stroke = 0.5pt + color
      let lang_fill = if type(color) == color { color.lighten(75%) } else { color.lighten(50%) }
      let b = measure(icon + name)
      box(
        radius: radius,
        fill: lang_fill,
        inset: padding,
        stroke: lang_stroke,
        outset: 0em,
        height: b.height + .3em ,// + padding * 2,
        text(fill: black, size: 0.7em)[#name #icon],
      )
    },
    highlight-fill: (c) => c.transparentize(75%),
    highlight-stroke: (c) => 0.4pt + c,
    highlight-inset: 0em, 
    highlight-outset: (x:0em, y:.3em),
    highlight-clip: false,
    highlight-radius: .4em,
    // highlighted-default-color: teal.darken(70%)
  )
  doc
}