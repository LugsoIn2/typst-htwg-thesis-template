#import "textTemplate.typ": *

#let cover(
  lang: "",
  title: "",
  degree: "",
  program: "",
  author: "",
  studentnumber: "",
  authormail: "",
  location: "",
  cover-font: "Arial",
  physicalPrint: true,
) = {
      {
        set page(
          margin: (left: 20mm, right: 10mm, top: 40mm, bottom: 40mm),
          numbering: none,
          number-align: center,
          background: image("../assets/report_cover_empty.svg"),
        )

        let htwg-color-dark-blue = rgb(51,65,82)
        let background-color = htwg-color-dark-blue
        let compile-date = datetime.today().display("[day].[month].[year]")
        let languageText = textTemplate(pagetype: "coverpage" ,lang: lang)

        set text(
          font: cover-font, 
          size: 12pt, 
          lang: lang,
          fill: white
        )
        
        // --- -------------- ---
        // --- -------------- ---
        // ------- Cover --------

        // ----- Char Pics ------
        place(
          top + left,
          dx: -15pt,
          dy: 100pt,
          box(
            fill: background-color,
            outset: (x: 20pt, y: 15pt),
            if degree == "Bachelor" {
              image("../assets/B_black.svg", width: 5.7%)
            } else if degree == "Master" {
              image("../assets/M_black.svg", width: 7%)
            }
        ))

        place(
          bottom + left,
          dx: 52pt,
          dy: 10pt,
          box(
            fill: background-color,
            outset: (x: 20pt, y: 15pt),
            if degree == "Bachelor" or degree == "Master" {
              image("../assets/S_black.svg", width: 5.2%)
            } else {
            }
        ))

        place(
          top + right,
          dx: -75pt,
          dy: 230pt,
          box(
            fill: background-color,
            outset: (x: 20pt, y: 15pt),
            if degree == "Bachelor" or degree == "Master" {
              image("../assets/C_black.svg", width: 5.2%)
            } else {
            }
        ))


        // -- Author Informations --
          place(
            top + right,
            dx: -20pt,
            dy: 15pt,
            box(
              fill: background-color,
              outset: (x: 20pt, y: 15pt),
              align(left, text(font: cover-font, size: 11pt, weight: 800, languageText.at(0))) +
              v(3mm) +
              align(left, text(font: cover-font, size: 10pt, weight: 400, author)) +
              align(left, text(font: cover-font, size: 10pt, weight: 400, languageText.at(1) + studentnumber)) +
              align(left, text(font: cover-font, size: 10pt, weight: 400, authormail))
            ))
          v(140mm)
        

        // -- Location and Date --
          place(
            bottom + right,
            dx: -40pt,
            dy: 50pt,
            box(
              fill: background-color,
              outset: (x: 20pt, y: 15pt),
              align(left, text(font: cover-font, size: 11pt, weight: 400, location + ", " + compile-date)
            )))


        // ------- Title --------
          box(
            fill: background-color,
            outset: (x: 40pt, y: 10pt),
            if degree == "Bachelor" or degree == "Master" {
              align(left, text(font: cover-font, 2em, weight: 100, degree + "thesis"))
            } else {
              align(left, text(font: cover-font, 2em, weight: 100, degree))
            } +
            align(left, text(font: cover-font, 2em, weight: 700, title))
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
