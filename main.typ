#import "lib/htwgThesis.typ": *
#import "lib/utils.typ": todo

// ----- ------------------ ---
// --- your Thesis Metadata ---
#let lang = "de" // "de" or "en"
#let title = "Deine spannende Thesis"
#let degree = "Master" // Bachelor or Master
#let program = "Informatik" // your student program
#let supervisor= "Prof. Dr. Max Mustermann"
#let advisors = ("Erika Mustermann",)
#let author = "John Stiles" // your name
#let studentnumber = "123456"
#let authormail = "johnstiles@htwg-konstanz.de"
#let location = "Konstanz"
#let startDate = datetime(day: 1, month: 1, year: 1970)
#let submissionDate = datetime(day: 1, month: 1, year: 1970)
#let birthdate = datetime(day: 01, month: 01, year: 1970)
#let birthplace = "Musterort"
#let companySentence = "an der HTWG-Konstanz" // see declarationOfHonour

// ----- ------------------ ---
// ----- template setting -----
#let citeStyle = "ieee"
#let show_appendix = true
#let show_glossary = true
#let show_list_of_tables = true
#let show_list_of_figures = true
#let appendicesList = (
  ("Anhang B: " + lorem(1), include("/appendix/appendix_example1.typ")),
  ("Anhang B: " + lorem(1), include("/appendix/appendix_example1.typ")),
)

// ----- ------------------ ---
#set document(title: title, author: author)
#show: htwgThesis.with(
  lang: lang,
  title: title,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  studentnumber: studentnumber,
  authormail: authormail,
  location: location,
  startDate: startDate,
  submissionDate: submissionDate,
  birthdate: birthdate,
  birthplace: birthplace,
  companySentence: companySentence,
  show_appendix: show_appendix,
  show_glossary: show_glossary,
  show_list_of_tables: show_list_of_tables,
  show_list_of_figures: show_list_of_figures,
  appendices: appendicesList,
  citeStyle: citeStyle,
)
// ----- ------------------ ---


// ----- ------------------ ---
// -- Include your Chapters ---
#include "chapters/examples.typ"
#include "chapters/ipsum.typ"
