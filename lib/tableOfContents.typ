#import "textTemplate.typ": *

#let tableOfContents(lang: "", table-of-contents-font: "Arial", font-color: "", ) = {
    
  let languageText = textTemplate(pagetype: "tableOfContents" ,lang: lang)

  // --- -------------- ----
  // --- -------------- ----
  // -- Table of Contents --
  align(right, outline(
    title: {
      text(font: table-of-contents-font, fill: font-color, size: 35pt, weight: 700, languageText.at(0))
      v(15mm)
    },
    indent: 2em
  ))
}