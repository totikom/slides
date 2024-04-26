#import "slides-theme.typ": *

#set text(lang: "ru", size: 25pt, font: "Fira Sans")
#show raw: set text(size: 25pt, font: "Fira Mono")

#show: inverse-theme
#set raw(theme: "themes/Halcyon.tmTheme")

#let qr(caption, name, href, size) = link(href, figure(
  caption: caption,
  numbering: none,
  image("img/qr/" + name + ".png", width: size),
))

#let clickable-qrs-footer = [
  #set align(center)
  #set text(size: 0.8em)
  _(QR кликабельны в PDF)_
]

#title-slide(
  title: [
    Что такое блокчейн?
  ],
  author: "Евгений Ломов",
  extra: [Междисциплинарная неделя "Кроссворда Тьюринга" и школы "Лес"],
)

#slide(title: "Обо мне")[
  #side-by-side[
    - Закончил Физфак МГУ по специальности "Квантовые вычисления"
    - Поработал в криптостартапе
    - Разрабатываю компиляторы для DSP
    - Организую школу "Лес"
    ][
      #qr(
      [
        Канал физического отделения "Лес"
      ],
      "fiz_forest",
      "https://t.me/physicists_in_the_forest",
      80%,
    )
      ]
    ]

#slide(title: "Ссылки", footer: clickable-qrs-footer)[
  #set align(center + horizon)
  #stack(dir: ltr, spacing: 5%,
    qr("На меня", "totikom", "https://totikom.github.io/", 30%),
    qr([На канал "Леса"], "forest", "https://t.me/forest_school_am", 30%),
    qr([На "ФизЛес"], "fiz_forest" ,"https://t.me/physicists_in_the_forest", 30%),
  )
]
