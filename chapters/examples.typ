#import "../lib/utils.typ": todo
#import "@preview/glossarium:0.4.1": gls, glspl

= Chapter Examples <chap1>

== Cite Example
#lorem(20) @bruegge2004object #cite(<bruegge2004object1>) #cite(label("bruegge2004object2"))

== Todo Example 
#lorem(10) 
#todo[Example TODO]

== Table Example
#lorem(10)
#figure(
  {
    table(
      columns: 2,
      [*Amount*], [*Ingredient*],
      [250g], [Butter (room temp.)],
      [150g], [Brown sugar],
      [100g], [Cane sugar],
      [100g], [70% cocoa chocolate],
      [100g], [35-40% cocoa chocolate],
      [2], [Eggs],
      [Pinch], [Salt],
      [Drizzle], [Vanilla extract],
    )
  },
  caption: [
    #lorem(3)
  ]
)

#figure(
  {
    set text(size: 0.8em, hyphenate: false, weight: "medium");
    let example(it) = [#text(fill: red)[#it]];
    table(
      columns: 2,
      [*Amount*], [*Ingredient*],
      [360g], [#example[Baking flour]],
      [250g], [Butter (room temp.)],
      [150g], [Brown sugar],
      [100g], [Cane sugar],
      [100g], [70% cocoa chocolate],
      [100g], [35-40% cocoa chocolate],
      [2], [Eggs],
      [Pinch], [Salt],
      [Drizzle], [Vanilla extract],
    )
  },
  caption: [
    #lorem(3)
  ]
)

== Example Figures
#lorem(20)
#figure(
    grid(
        columns: 2, 
        row-gutter: 2mm,    
        [#image("../figures/dummyimage.png", width: 50%)],
        [#image("../figures/dummyimage.png", width: 50%)],

    ),
  caption: [
    #lorem(5)
  ]
) <figure>

#lorem(20)

#figure(
    grid(
        [#image("../figures/dummyimage.png", width: 70%)],


    ),
  caption: [
    #lorem(5)
  ]
) <figure2>

== Example Glossar
#lorem(20)
#gls("oidc")
#gls("potato")
#gls("dm")


