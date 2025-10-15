#import "@preview/mannot:0.3.0" : *

#let maths(doc) = {
  // show math.equation: set text(
  //  size: .75em, 
  //  top-edge: "baseline",
  //  bottom-edge: "baseline",
  //  fill: white
  // )
  // show math.equation: it => box(
  //   stroke: black+.4pt,
  //   height: measure({
  //     set text(
  //       // top-edge: "baseline",
  //       bottom-edge: "baseline",
  //     )
  //     it
  //   }).height,
  //   align(
  //     horizon,
  //     box(
  //       fill: silver.transparentize(50%),
  //       inset: (x: .3em, y: 0em),
  //       outset: (y: 1em),
  //       stroke: gray + .4pt,
  //       radius: .5em,
  //       it
  //     )
  //   )
  // )
  doc
}