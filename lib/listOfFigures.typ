#import "textTemplate.typ": *

#let listOfFigures(lang: "") = {

  let languageText = textTemplate(pagetype: "listOfFigures" ,lang: lang)
  
  // --- -------------- ----
  // --- -------------- ----
  // --- list of figures ---
  outline(
    title: languageText.at(0),
    target: figure.where(kind: image)
  )
}