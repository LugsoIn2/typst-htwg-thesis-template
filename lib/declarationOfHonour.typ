#import "textTemplate.typ": *

#let declarationOfHonour(
  lang: "",
  title: "",
  degree: "",
  author: "",
  submissionDate: datetime,
  birthdate: datetime,
  birthplace: "",
  companySentence: "",
  supervisor: "",
  declarationOfHonour-font: "Arial",
  location: "",
  physicalPrint: true,
) = { 
      {
        set page(
          margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
          numbering: "i",
          number-align: center,
        )
        set par(justify: true,)

        let languageText = textTemplate(
          pagetype: "declarationOfHonour" ,
          lang: lang, 
          textblocks: (author, birthdate.display("[day].[month].[year]"),
            birthplace, 
            degree, 
            title, 
            companySentence, 
            supervisor
          )
        )

        set text(
          font: declarationOfHonour-font, 
          size: 12pt, 
          lang: lang
        )

        // --- -------------- ----
        // --- -------------- ----
        // - declarationOfHonour -

        text(languageText.at(0))
        v(40pt)
        text(languageText.at(1))
        v(5pt)
        text(weight: 800, languageText.at(2))
        v(5pt)
        text(languageText.at(3))
        v(40pt)
        text(languageText.at(4))
        v(40pt)
        text(languageText.at(5))
        v(30pt)
        text(languageText.at(6))
        v(40mm)
        grid(
            columns: 2,
            gutter: 1fr,
            location + ", " + submissionDate.display("[day].[month].[year]"), 
            "______________________"
        )
      }
      if physicalPrint {
        pagebreak()
      }
      {
        set page(
          margin: (left: 20mm, right: 20mm, top: 40mm, bottom: 40mm),
          numbering: "i",
          number-align: center,
        )
      }
}