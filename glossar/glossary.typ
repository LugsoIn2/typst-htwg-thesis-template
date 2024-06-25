// this is an example. Check https://typst.app/universe/package/glossarium
#let glossary = (
    // minimal term
    (key: "kuleuven", short: "KU Leuven"),
  
    // a term with a long form and a group
    (key: "unamur", short: "UNamur", long: "Namur University", 
    // group: "Universities"
    ),

    // a term with a markup description
    (
      key: "oidc", 
      short: "OIDC", 
      long: "OpenID Connect", 
      desc: [OpenID is an open standard and decentralized authentication protocol promoted by the non-profit
      #link("https://en.wikipedia.org/wiki/OpenID#OpenID_Foundation")[OpenID Foundation].],
      // group: "Accronyms",
    ),

    // a term with a short plural 
    (
      key: "potato",
      short: "potato",
      // "plural" will be used when "short" should be pluralized
      plural: "potatoes",
      desc: [#lorem(10)],
    ),

    // a term with a long plural 
    (
      key: "dm",
      short: "DM",
      long: "diagonal matrix",
      // "longplural" will be used when "long" should be pluralized
      longplural: "diagonal matrices",
      desc: "Probably some math stuff idk",
    ),
  )