#let appendix(lang: "", appendix-font: "Arial", appendices: ()) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "i",
    number-align: center,
  )
  counter(page).update(1)

  set text(
    font: appendix-font, 
    size: 12pt, 
    lang: lang,
  )

  // {
  //   outline(
  //     title: {
  //       text(size: 35pt, weight: 700, "Appendix")
  //       v(15mm)
  //     },
  //     // title: "",
  //     indent: 2em
  //   )
  //   show heading: none
  //   heading(numbering: none)[Appendix]
  //   pagebreak(weak: true, to: "odd")
  // }

  // label("aaa")
  // --- appendix---

  for appendix in appendices {
    // label("aaa")
    set page(number-align: center) 
    // Ausgabe des Anhang Titels
    let (marker, include_statement) = appendix
    counter(heading).update(0)
    heading(numbering: none, level: 1)[#(marker)]
    set heading(outlined: false)
    include_statement
    set heading(outlined: true)
  }

  // body
  // v(1fr)
}