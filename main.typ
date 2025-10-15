#import "set/codes.typ": *
#import "set/maths.typ": *
#import "set/miscs.typ": *

#show: codes
#show: maths

// #set par(leading: 1em)
#set text(
  12pt,
  font:(
    "Sarasa UI SC",
    "Sarasa UI SC"
  )
)
#set page(
  paper: "a3", 
  flipped: true,
  columns: 2
  // margin: (x: 8pt, y: 8pt)
)

+ 计算 $x+y$

+ 第一布里渊区的范围是：$-pi / a < k < pi / a$

+ 白日依山尽，黄河入海流

#text(20pt, blue, stroke: .4pt + teal)[问题：]

- 如果传入的公式是行间公式，不清楚如何放置下划线\
  $display(integral f(x)dif x)$ hello world

  那么会怎么样呢 ? 是否会有缩进\
  是否会有缩进 ?

- 不清楚如何针对公式的宽度自适应下划线的位置 : 对于 $upright(p^+n)$ 结，\
  其扩散电容的表达式为：
  $ C_D = (frac(A q^2 p_(n_0)L_p, k_o T)) exp(frac(q V , k_o T))$
  $display(integral f(x)dif x)$

```python
x = 3
print("Hello, World!")
```

#{
  let txt = [Here is the content of the variable *with style*]
  highlight(
    fill: rgb("#eded1f"),
    stroke: gray+.4pt,
    extent: 2pt,
    radius: 30%,
    [#txt]
  ) 
}

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
    (line: 5, start: 29, end: 35, fill: teal, tag: "(b)")
  ),
  // highlighted-lines: (4, 5)
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

#repr[#strong] , #type[#strong]

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

#let value = context text.lang
#value
#set text(lang: "de")
#value
#set text(lang: "fr")
#value

#let items = ([A], [g], [中], $1$)
#context table(
  columns: 2,
  stroke: (x: .4pt, y: .4pt),
  ..items
    .map(it => (
      align(center)[#it],
      [#measure({
        set text(
          top-edge: "baseline", 
          bottom-edge: "baseline"
          // bottom-edge: "descender"
        )
        it
      })],
    ))
    .flatten()
)

$mark(x, color: #green)
+ markhl(f(x), color: #purple, stroke: #.4pt, radius: #.4em)
+ markrect(e^x, color: #red, fill: #blue, outset: #.2em)
+ markul(x + 1, color: #gray, stroke: #.4pt)
+ markhl(display(integral f(x) dif x), color: #teal)$
