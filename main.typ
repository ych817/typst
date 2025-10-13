#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/pleast:0.3.0": plist
// #import "@preview/zebraw:0.5.5": *

#set text(
  12pt,
  font:(
    "Sarasa UI SC",
    "Sarasa UI SC"
  )
)
// #set math.equation(block: true)
// #show math.equation: set text(size: .75em, fill: rgb("#a9b1d6"))
// #show math.equation: box.with(
//   fill: rgb("#000000"),
//   inset: (x: .3em, y: 0em),
//   outset: (y: .3em),
//   radius: .5em,
// )
#set page(
  paper: "a3", 
  flipped: true,
  columns: 2
  // margin: (x: 8pt, y: 8pt)
)
#set raw(
  theme: "tokyo-night.tmTheme"
)
#show raw: set text(fill: rgb("#a9b1d6"))
#show raw.where(block: false): box.with(
  fill: rgb("#1d2433"),
  inset: (x: .3em, y: 0em),
  outset: (y: .3em),
  radius: .5em,
)
#show: codly-init.with()
// #show figure.where(kind: "__codly-raw-line"): set text(fill: rgb("#a9b1d6"))
// #show figure.where(kind: "codly-line"): set text(fill: rgb("#a9b1d6"))
#codly(
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
)

#set par(leading: 1em)
#let uline(answer: false, body) = context {
  let show_all_answer = false
  show_all_answer = true
  
  let y = 1em / 5
  let l = measure(body).width + 3pt
  if body.has("block") { // 内容是否是公式
    if body.fields().block { // 行间公式
      set align(center)
      block(outset: (bottom:0.1em), stroke: (bottom: 0.6pt))[#body]
      return
    } else { // 行内公式
      y = 1em / 2
    }
  }
  box(place(dy: y, dx: 2pt, line(length: l, stroke: .6pt)))
  if show_all_answer {
    [ ] + body + [ ]
  } else {
    [ ] + if answer { body } else { hide(body) } + [ ]
  }
}
+ 计算 #uline()[$x+y$]

+ 第一布里渊区的范围是：#uline(answer: true, $-pi / a < k < pi / a$)

+ 白日依山尽，#uline()[黄河入海流]

#text(20pt, blue, stroke: .4pt + teal)[问题：]

- 如果传入的公式是行间公式，不清楚如何放置下划线\
  #uline()[$ f(x)dif x $]

- 不清楚如何针对公式的宽度自适应下划线的位置\
  对于 $upright(p^+n)$ 结，其扩散电容的表达式为：
  #uline(answer: true)[
    $ C_D = (frac(A q^2 p_(n_0)L_p, k_o T)) exp(frac(q V , k_o T))$
  ]

你好。下面是一段测试文字 。

```python
x = 3
print("Hello, World!")
```

#let txt = [Here is the content of the variable *with style*]

#highlight(
  fill: rgb("#eded1f"),
  stroke: gray+.4pt,
  extent: 2pt,
  radius: 30%,
  [#txt]
)

#let code-example = [
#let forecast(day) = block[
  #box(square(
    width: 2cm,
    inset: 8pt,
    fill: if day.weather == "sunny" {
      yellow
    } else {
      aqua
    },
    align(
      bottom + right,
      strong(day.weather),
    ),
  ))
  #h(6pt)
  #set text(22pt, baseline: -8pt)
  #day.temperature °#day.unit // 你好呀
]  
]

#codly(
  header: [Hello World],
  highlights: (
    (line: 4, start: 5, end: 14, fill: orange, tag: "(c)"),
    (line: 5, start: 14, end: 16, fill: green, tag: "(a)"),
    (line: 5, start: 29, end: 35, fill: teal, tag: "(b)"))
)
```typ
#let forecast(day) = block[
  #box(square(
    width: 2cm,
    inset: 8pt,
    fill: if day.weather == "sunny" {
      yellow
    } else {
      aqua
    },
    align(
      bottom + right,
      strong(day.weather),
    ),
  ))
  #h(6pt)
  #set text(22pt, baseline: -8pt)
  #day.temperature °#day.unit // 你好呀
]
#let forecast(day) = block[
  #box(square(
    width: 2cm,
    inset: 8pt,
    fill: if day.weather == "sunny" {
      yellow
    } else {
      aqua
    },
    align(
      bottom + right,
      strong(day.weather),
    ),
  ))
  #h(6pt)
  #set text(22pt, baseline: -8pt)
  #day.temperature °#day.unit
]
```

`zebraw` 测试

Adding `rbx` to `rcx` gives
the desired result.

What is ```rust fn main()``` in Rust
would be ```c int main()``` in C.

// #let zebcode = ```typ
// #let forecast(day) = block[
//   #box(square(
//     width: 2cm,
//     inset: 8pt,
//     fill: if day.weather == "sunny" {
//       yellow
//     } else {
//       aqua
//     },
//     align(
//       bottom + right,
//       strong(day.weather),
//     ),
//   ))
//   #h(6pt)
//   #set text(22pt, baseline: -8pt)
//   #day.temperature °#day.unit
// ]
// ```

// #zebraw(
//   hanging-indent: true,
//   background-color: rgb("#1d2433"),
//   lang: text(black)[typst],
//   lang-color: eastern,
//   lang-font-args: (
//     font: "Buenard",
//     weight: "bold",
//     fill: white,
//   ),
//   header: text(black)[*Test Code*],
//   zebcode
// )


```rust
fn main() {
    println!("Hello World!");
}
```

This has ``` `backticks` ``` in it
(but the spaces are trimmed). And
``` here``` the leading space is
also trimmed.

#strong[Hello world]

#strong([Hello World])

#{
  let x = 2 ; let z = 3
  let y = x + 5 ; y + z
}

#repr[#strong]\
#type[#strong]

`Hello world ! this is a very very very very very very very very very very very lo` `ng text`




// #let auto-columns(count, body) = context {
//   let items = body.children.filter(el => el.func() == enum.item)
//   let height = measure(enum(..items.slice(0, calc.ceil(items.len() / count)))).height
//   block(height: height, columns(count, body))
// }

// 设 $A eq.not nothing and op("Tr")(A)$，下列谓词或项绝对。
// #auto-columns(3)[
//   + $a in b$
//   + $a = b$
//   + $MM(a)$
//   + $Pr(a)$
//   + $nothing$
//   + $a subset.eq b$
//   + $a subset b$
//   + ${a, b}$
//   + $union a$
//   + $inter a$
//   + $a union b$
//   + $a inter b$
//   + $a - b$
//   + ${a_1 ,dots.h, a_n}$
//   + #align(alignment.horizon)[
//       $display(sum_(k=0)^114514 a_3)$ 泥濠\
//       Hello world , \
//       bonjour monde
//     ]
//   + $a$
//   + $b$
// ]
