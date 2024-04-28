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

#focus-slide[
  Часть 1: Немного истории и постановка задачи
]

#slide(title: "Обмен в доцифровую эпоху")[
  #side-by-side[
    #uncover("2-")[
      #image("img/coins.jpg", width: 100%)
    ]
  ][
    #uncover("3-")[
      #image("img/cheque.jpg", width: 100%)
    ]
  ]
]

#slide(title: "Компьютерные системы и Интернет")[
  #side-by-side[
    #align(center)[
      #uncover(3)[
        #text(4em)[???]
      ]
    ]
  ][
    #uncover("2-")[
      #image("img/card.png", width: 100%)
    ]
  ]
]

#slide(title: "Наличные и банковская система")[
  #side-by-side[
    #align(top)[
      #align(center, [= Наличные])
      #line-by-line(start: 2)[
        - Нет посредника
        - Необратимость без согласия сторон
        - Нет накладных расходов
      ]
    ]
  ][
    #align(top)[
      #align(center, [= Банк])
      #line-by-line(start: 2)[
        - Банк является доверенной третьей стороной
        - Банковкая операция может быть отменена
        - Банковский перевод - платная услуга
      ]
    ]
  ]
]

#slide(title: "Электронные деньги")[
  #line-by-line(start: 2)[
    - Нет посредника, которому необходимо доверять
    - Необратимые операции
    - Низкая стоимость транзакций
    - Отсутствие слежки
  ]
]

#slide(title: "Проблемы, которые надо решить")[
  #side-by-side[
    #line-by-line(start: 2)[
      - Подтверждение личности отправителя
      - Проверка наличия средств у отправителя
      - Невозможность тратить одни и те же деньги несколько раз
    ]
  ][
    #image("img/cheque.jpg", width: 100%)
  ]
]

#slide(title: "Ссылки", footer: clickable-qrs-footer)[
  #set align(center + horizon)
  #stack(dir: ltr, spacing: 5%,
  qr("На меня", "totikom", "https://totikom.github.io/", 30%),
  qr([На канал "Леса"], "forest", "https://t.me/forest_school_am", 30%),
  qr([На "ФизЛес"], "fiz_forest" ,"https://t.me/physicists_in_the_forest", 30%),
]
