#let textTemplate(pagetype: "" , lang: "", textblocks: ()) = {

  // --- -------------- ----
  // --- -------------- ----
  // ----- cover text ------
  let coverpageText = (
        (lang == "de",(
          "Eingereicht von", 
          "Matrikelnummer: ",
          )
        ),
        (lang == "en",(
          "Submitted by",
          "Student Number: ",
          )
        ),
      ).find(t => t.at(0)).at(1)


  // --- -------------- ----
  // --- -------------- ----
  // --- titlepage text ----
  let titlepageText = (
        (lang == "de",(
          "von", 
          "zur Erlangung des akademischen Grades", 
          "im Studiengang ", 
          "an der Hochschule Konstanz für Technik, Wirtschaft und Gestaltung.",
          "Matrikelnummer: ",
          "Startdatum: ",
          "Abgabedatum: ",
          "Erstprüfer: ",
          "Zweitprüfer: ",
          )
        ),
        (lang == "en",(
          "by",
          "in Partial Fulfillment of the Requirements for the Degree of",
          "in Applied ",
          "at the Hochschule Konstanz University of Applied Sciences.",
          "Student Number: ",
          "Date of Start: ",
          "Date of Submission: ",
          "Supervisor: ",
          "Second Examiner: ",
          )
        ),
      ).find(t => t.at(0)).at(1)


  // --- -------------------- ----
  // --- -------------------- ----
  // - declarationOfHonour text --
  let author = ""
  let birthdate = ""
  let birthplace = ""
  let degree = ""
  let title = ""
  let companySentence = ""
  let supervisor = ""
  if pagetype == "declarationOfHonour" {
    (author, birthdate, birthplace, degree, title, companySentence, supervisor) = textblocks
  }

  let declarationOfHonourText = (
        (lang == "de",(
          "Hiermit erkläre ich, " + author + ", geboren am " + birthdate + " in " + birthplace + ",",
          "(1) dass ich meine " + degree + "thesis mit dem Titel:",
          "„" + title + "“",
          companySentence + " unter Anleitung von " + supervisor + " selbständig und ohne fremde Hilfe angefertigt habe und keine anderen als die angeführten Hilfen benutzt habe.",
          "(2) dass ich die Übernahme wörtlicher Zitate, von Tabellen, Zeichnungen, Bildern und Programmen aus der Literatur oder anderen Quellen (Internet) sowie die Verwendung der Gedanken anderer Autoren an den entsprechenden Stellen innerhalb der Arbeit gekennzeichnet habe.",
          "(3) dass die eingereichten Abgabe-Exemplare in Papierform und im PDF-Format vollständig übereinstimmen.",
          "Ich bin mir bewusst, dass eine falsche Erklärung rechtliche Folgen haben wird.",
          )
        ),
        (lang == "en",(
          "Hiermit erkläre ich, " + author + ", geboren am " + birthdate + " in " + birthplace + ",",
          "(1) dass ich meine " + degree + "thesis mit dem Titel:",
          "„" + title + "“",
          companySentence + " unter Anleitung von " + supervisor + " selbständig und ohne fremde Hilfe angefertigt habe und keine anderen als die angeführten Hilfen benutzt habe.",
          "(2) dass ich die Übernahme wörtlicher Zitate, von Tabellen, Zeichnungen, Bildern und Programmen aus der Literatur oder anderen Quellen (Internet) sowie die Verwendung der Gedanken anderer Autoren an den entsprechenden Stellen innerhalb der Arbeit gekennzeichnet habe.",
          "(3) dass die eingereichten Abgabe-Exemplare in Papierform und im PDF-Format vollständig übereinstimmen.",
          "Ich bin mir bewusst, dass eine falsche Erklärung rechtliche Folgen haben wird.",
          )
        ),
      ).find(t => t.at(0)).at(1)



  // --- -------------- ----
  // --- -------------- ----
  // --- abstract title ----
  let abstractTitle = (
    (lang == "de",("Zusammenfassung",)),
    (lang == "en",("Abstract",)),
  ).find(t => t.at(0)).at(1)


  // --- ------------------ ----
  // --- ------------------ ----
  // - table of contents title -
  let tableOfContentsTitle = (
    (lang == "de",("Inhaltsverzeichnis",)),
    (lang == "en",("Contents",)),
  ).find(t => t.at(0)).at(1)


  // --- ------------------ ----
  // --- ------------------ ----
  // ------ glossary title -----
  let glossaryTitle = (
    (lang == "de",("Glossar",)),
    (lang == "en",("Glossary",)),
  ).find(t => t.at(0)).at(1)


  // --- ------------------ ----
  // --- ------------------ ----
  // -- table of figures title -
  let listOfFiguresTitle = (
    (lang == "de",("Abbildungsverzeichnis",)),
    (lang == "en",("List of Figures",)),
  ).find(t => t.at(0)).at(1)


  // --- ------------------ ----
  // --- ------------------ ----
  // --- list of tables title --
  let listOfTablesTitle = (
    (lang == "de",("Tabellenverzeichnis",)),
    (lang == "en",("List of Tables",)),
  ).find(t => t.at(0)).at(1)


  // --- ------------------ ----
  // --- ------------------ ----
  // ---- bibliography title ---
  let bibliographyTitle = (
    (lang == "de",("Literatur",)),
    (lang == "en",("References",)),
  ).find(t => t.at(0)).at(1)


  // --- --------------- ----
  // --- --------------- ----
  // ----- return value -----
  let languageText = (
    (pagetype == "titlepage", titlepageText),
    (pagetype == "coverpage", coverpageText),
    (pagetype == "declarationOfHonour", declarationOfHonourText),
    (pagetype == "abstract", abstractTitle),
    (pagetype == "tableOfContents", tableOfContentsTitle),
    (pagetype == "listOfFigures", listOfFiguresTitle),
    (pagetype == "listOfTables", listOfTablesTitle),
    (pagetype == "bibliography", bibliographyTitle),
    (pagetype == "glossary", glossaryTitle),
  ).find(t => t.at(0)).at(1)
  languageText
}