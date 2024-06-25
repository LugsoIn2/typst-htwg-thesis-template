#import "textTemplate.typ": *

#let titlepage(
  lang: "",
  title: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  startDate: datetime,
  submissionDate: datetime,
  studentnumber: "",
  title-font: "Arial",
) = {
      {        
        set page(
          margin: (left: 20mm, right: 20mm, top: 40mm, bottom: 40mm),
          numbering: "i",
          number-align: center,
          background: image("../assets/report_titel_page.svg"),
        )

        let htwg-color-dark = rgb(43,57,75) // rgb(51,65,82)
        let htwg-color-green = rgb(0,155,145)
        let background-color = white
        let languageText = textTemplate(pagetype: "titlepage" ,lang: lang)

        set text(
          font: title-font, 
          size: 12pt, 
          lang: lang,
        )


        // --- -------------- ----
        // --- -------------- ----
        // ----- Title Page ------
        v(40mm)
        box(
          fill: background-color,
          outset: (x: 40pt, y: 10pt),
          if degree == "Bachelor" or degree == "Master" {
            align(left, text(font: title-font, fill: htwg-color-green, 2em, weight: 100, degree + "thesis"))
          } else {
            align(left, text(font: title-font, fill: htwg-color-green, 2em, weight: 100, degree))
          } +
          align(left, text(font: title-font, fill: htwg-color-green, 2em, weight: 700, title))
        ) 

        v(10mm)
        align(left, text(font: title-font, weight: 100, languageText.at(0)))
        v(5mm)
        box(
          fill: background-color,
          outset: (x: 10pt, y: 10pt),
          align(left, text(font: title-font, size: 15pt, weight: 800, author))
        ) 
        v(15mm)
        align(left, text(font: title-font, weight: 100, languageText.at(1)))
        v(6mm)
        box(
          fill: background-color,
          outset: (x: 10pt, y: 10pt),
          if degree == "Bachelor" {
            align(left, text(font: title-font, weight: 800, "Bachelor of Science"))
          } else if degree == "Master" {
            align(left, text(font: title-font, weight: 800, "Master of Science"))
          }
        )
        align(left, text(font: title-font, weight: 100, languageText.at(2) + program ))
        v(6mm)
        box(
          fill: background-color,
          outset: (x: 10pt, y: 10pt),
          align(left, text(font: title-font, weight: 100, languageText.at(3)))
        )
        v(15mm)

        let entries = ()
        entries.push((languageText.at(4), studentnumber))
        entries.push((languageText.at(5), startDate.display("[day].[month].[year]")))
        entries.push((languageText.at(6), submissionDate.display("[day].[month].[year]")))
        entries.push((languageText.at(7), supervisor))
        if advisors.len() > 0 {
          entries.push((languageText.at(8), advisors.join(", ")))
        }
        box(
          fill: background-color,
          outset: (x: 5pt, y: 10pt),
          pad(
            grid(
              columns: 2,
              gutter: 1.1em,
              ..for (term, desc) in entries {
                (strong(term), desc)
              }
            )
          )
        )
      }
      pagebreak()
      {
        set page(
          margin: (left: 20mm, right: 20mm, top: 40mm, bottom: 40mm),
          numbering: "i",
          number-align: center,
        )
      }
}