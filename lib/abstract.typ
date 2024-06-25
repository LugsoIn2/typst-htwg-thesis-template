#import "textTemplate.typ": *

#let abstractPages(body, lang: "", abstract-font: "Arial") = {

  let languageText = textTemplate(pagetype: "abstract" ,lang: lang)
  
  heading(numbering: none, outlined: false)[#languageText.at(0)]

  set text(
    font: abstract-font, 
    size: 12pt, 
    lang: lang,
  )
   set par(justify: true,)

  // --- -------------- ---
  // --- -------------- ---
  // ----- Abstract -------
  body
  v(1fr)
}