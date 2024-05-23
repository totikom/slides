#import "@preview/polylux:0.3.1": *
#import "colors.typ": background-color, text-color, dim-text-color

#let accent-color = rgb("#eb811b")
#let header-color = background-color.lighten(10%)

#let inverse-theme(aspect-ratio: "16-9", body) = {
  set page(paper: "presentation-" + aspect-ratio, fill: background-color)
  set text(fill: text-color)
  body
}

#let title-slide(title: [], author: none, extra: none) = {
  polylux-slide({
    block(width: 100%, inset: 2em, {
      text(size: 1.3em, strong(title))
      if author != none or extra != none {
        line(length: 100%, stroke: .05em + accent-color)
      }
      if author != none {
        block(spacing: 1em, author)
      }
      if extra != none {
        set text(size: .8em)
        block(spacing: 1em, extra)
      }
    })
  })
  logic.logical-slide.update(0)
}

#let slide(title: [], footer: [], content) = {
  let header = {
    set align(top)
    box(width: 100%, height: 100%, inset: 1.5em, fill: header-color, {
      set align(horizon)
      set text(size: 1.2em)
      strong(title)
    })
  }

  if footer == [] {
    footer = {
      set text(fill: dim-text-color)
      set align(right)
      box(inset: (right: 0.4em), logic.logical-slide.display())
    }
  }

  set page(header: header, footer: footer, margin: (top: 3em, left: 0em, right: 0em, bottom: 1.5em))
  polylux-slide({
    show: align.with(horizon)
    box(width: 100%, height: 100%, inset: 1.5em, content)
  })
}

#let focus-slide(content) = {
  set page(fill: background-color)
  set text(fill: accent-color, size: 2em)
  polylux-slide({
    align(horizon + center, content)
  })
  logic.logical-slide.update(n => n - 1)
}

#let alert = text.with(fill: accent-color)

// vim: sw=2 ts=2 et
