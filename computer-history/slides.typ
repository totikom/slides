#import "slides-theme.typ": *

#set text(lang: "ru", size: 25pt, font: "Fira Sans")
#show raw: set text(size: 25pt, font: "Fira Mono")

#show: inverse-theme
#set raw(theme: "themes/Halcyon.tmTheme")

#let qr(caption, name, href, size) = link(href, figure(
  caption: caption,
  numbering: none,
  image("figures/qr/" + name + ".png", width: size),
))

#let clickable-qrs-footer = [
  #set align(center)
  #set text(size: 0.8em)
  _(QR кликабельны в PDF)_
]

#title-slide(
  title: [
    История вычислительной техники
  ],
  author: "Евгений Ломов",
  extra: [Открытая лекция от школы "Лес"],
)

#slide(title: "Обо мне")[
  #side-by-side[
    - Закончил Физфак МГУ по специальности "Квантовые вычисления"
    - Работаю в Moscow Compiler Lab
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

#focus-slide[
  А зачем вообще нужен компьютер?
]

#focus-slide[
  Часть 1: С чего всё начиналось?
]

#slide(title: "Первые механичекие вычислители")[
  #side-by-side()[
    Антикитерский механизм – первый известный аналоговый вычислитель (\~100 г. до н.э.).
    Позволял определять:
    - Положения Солнца
    - Положения и фазу Луны
    - Даты солнечных и лунных затмений
    - Даты греческих празднеств
  ][
    #align(center)[
      #only(1)[
        #image("figures/Antikythera.png")
      ]
      #only(2)[
        #image("figures/Anticytherian_device_modern.jpg")
      ]
    ]
  ]
]

#slide(title: "Астролябия")[
  #side-by-side[
    II век н.э., Древняя Греция
    Определяет:
    - Стереографическая проекция звездного неба
    - Определяет продолжительность дня и ночи
    - Положение планет
  ][
    #image("figures/Astrolabe.jpg", width: 100%)
  ]
]
