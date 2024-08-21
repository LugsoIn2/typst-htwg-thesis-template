#import "cover.typ": *
#import "titlepage.typ": *
#import "declarationOfHonour.typ": *
#import "abstract.typ": *
#import "appendix.typ": *
#import "tableOfContents.typ": *
#import "listOfFigures.typ": *
#import "listOfTables.typ": *
#import "textTemplate.typ": *
#import "@preview/glossarium:0.4.1": make-glossary, print-glossary, gls, glspl
#import "../glossar/glossary.typ": glossary
#show: make-glossary

#let htwgThesis(
  lang: "",
  title: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  studentnumber: "",
  authormail: "",
  location: "",
  startDate: datetime,
  submissionDate: datetime,
  abstract: include "/abstract/abstract.typ",
  body,
  birthdate: datetime,
  birthplace: "",
  companySentence: "",
  show_appendix: bool,
  show_glossary: bool,
  show_list_of_tables: bool,
  show_list_of_figures: bool,
  appendices: (),
  citeStyle: "ieee",
  physicalPrint: true,
) = {
  // --- ---------------- ----
  // - Check degree settings -
  assert(degree in ("Bachelor", "Master"), message: "The degree must be either 'Bachelor' or 'Master'")

  let arial-font = "Arial"
  let htwg-color-green = rgb(0,155,145)
  let chap-title-color = htwg-color-green
  let thesis-template-font = arial-font

  // --- ---------------- ----
  // --------- cover ---------
  cover(
    lang: lang,
    title: title,
    degree: degree,
    program: program,
    author: author,
    studentnumber: studentnumber,
    authormail: authormail,
    location: location,
    physicalPrint: physicalPrint,
  )

  // --- ---------------- ----
  // -------- titlepage ------
  titlepage(
    lang: lang,
    title: title,
    degree: degree,
    program: program,
    supervisor: supervisor,
    advisors: advisors,
    author: author,
    startDate: startDate,
    submissionDate: submissionDate,
    studentnumber: studentnumber,
    physicalPrint: physicalPrint,
  )

  // --- ---------------- ----
  // -- declarationOfHonour --
  declarationOfHonour(
    lang: lang,
    title: title,
    degree: degree,
    author: author,
    submissionDate: submissionDate,
    birthdate: birthdate,
    birthplace: birthplace,
    companySentence: companySentence,
    supervisor: supervisor,
    location: location,
    physicalPrint: physicalPrint,
  )

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "i",
    number-align: center,
  )

  set text(
    font: thesis-template-font, 
    size: 12pt, 
    lang: lang
  )
  
  show math.equation: set text(weight: 400)

  // --- ---------------- ----
  // -------- Headings -------
  show heading: set block(below: 1.85em, above: 1.85em)
  show heading: set text(font: thesis-template-font, overhang: false)
  show heading.where(level: 1): set text(fill: htwg-color-green, size: 30pt)
  show heading.where(level: 1): set align(right)
  show heading.where(level: 1): set block(below: 2.0em)
  set heading(numbering: "1.1.")

  // --- ---------------- ----
  // Level 1 Pagebreak to odd
  show heading.where(level: 1): it => [
    // #pagebreak(weak: true, to: "odd")
    #if physicalPrint {
      pagebreak(weak: true, to: "odd")
    } else {
      pagebreak(weak: true)
    }
    #it
  ]
  
  // --- ---------------- ----
  // link and ref color
  show ref: set text(fill: htwg-color-green)
  show link: set text(fill: htwg-color-green)

  // --- ---------------- ----
  // ------- Citations -------
  set cite(style: citeStyle)

  // --- ---------------- ----
  // -------- Figures --------
  show figure: set text(size: 0.85em)

  // --- ---------------- ----
  // ------- Abstract --------
  abstractPages(lang: lang)[#abstract]

  // --- ---------------- ----
  // ---- tableOfContents ----
  tableOfContents(
    lang: lang, 
    table-of-contents-font: thesis-template-font, 
    font-color: chap-title-color
  )

  // --- ---------------- ----
  // - restart page counter --
  set page(
    numbering: "1",
    number-align: center,
  )
  counter(page).update(1)

  // --- ---------------- ----
  // ------- glossary --------
  if show_glossary == true {
    let languageTextGlossary = textTemplate(pagetype: "glossary" ,lang: lang)
    heading(numbering: none)[#languageTextGlossary.at(0)]
    print-glossary(glossary)
  }

  // --- ---------------- ----
  // --- main content ---
  set par(justify: true,)
  body

  // --- ---------------- ----
  // ---- list of figures ----
  if show_list_of_figures == true {
    listOfFigures(lang: lang)
  }
  
  // --- ---------------- ----
  // ---- list of tables ----
  if show_list_of_tables == true {
    listOfTables(lang: lang)
  }

  // --- ---------------- ----
  // ------ bibliography -----
  let languageTextBibl = textTemplate(pagetype: "bibliography" ,lang: lang)
  bibliography("../bib/bibliography.bib", title: languageTextBibl.at(0))

  // --- ---------------- ----
  // -------- appendix -------
  if show_appendix == true {
    appendix(lang: lang, appendices: appendices)
  }
}