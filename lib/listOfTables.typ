#import "textTemplate.typ": *

#let listOfTables(lang: "") = {

  let languageText = textTemplate(pagetype: "listOfTables" ,lang: lang)

  // --- -------------- ----
  // --- -------------- ----
  // --- list of tables ---
  outline(
    title: languageText.at(0),
    target: figure.where(kind: table)
  )
}