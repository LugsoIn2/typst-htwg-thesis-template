#let todo(it) = [
    #text(size: 0.8em)[#emoji.wrench]  #text(it, fill: red, weight: 800, size: 12pt)
]

#let thesisPagebreak(physicalPrint: bool) = {
  if physicalPrint {
    pagebreak(weak: true, to: "odd")
  } else {
    pagebreak()
  }
}