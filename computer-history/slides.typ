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
  Часть 1: Навигация
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
    - Продолжительность дня и ночи
    - Положение планет
  ][
    #image("figures/Astrolabe.jpg", width: 100%)
  ]
]

#focus-slide[
  Часть 2: Арифметика
]

#slide(title: "Паскалина")[
  1642г, Франция
    #image("figures/Pascaline.jpg", width: 100%)
]

#slide(title: "Паскалина: перенос")[
  #align(center)[
    #image("figures/Pascaline_carry_mechanism.jpg", width: 100%)
  ]
]

#slide(title: [Паскалина: дополнение до #strike[двойки] девятки])[
  - $"CP"(A) = 10^n - 1 - A$
  - $"CP"("CP"(A)) = 10^n - 1 - (10^n - 1 - A) = A$
  - $"CP"(A - B) = 10^n - 1 - (A - B) = 10^n - 1 - A + B = "CP"(A) + B$
]

#slide(title: [Паскалина: дополнение до девятки])[
    #image("figures/Pascaline.jpg", width: 100%)
]

#focus-slide[
  Часть 3: вычисление элементарных функций
]

#slide(title: "Элементарные функции")[
  - полиномы, пример: $x^3 + x^2 + x$
  - показательная и логарифмическая функции: $a^x$, $ln(x)$
  - тригонометрические функции: $sin$, $cos$, $tg$...
  - обратные тригонометрические: $arcsin$, $arccos$...
]

#slide(title: "А что вообще считали?")[
  - Различные системы уравнений для физики
  - Таблицы для стрельбы. War never changes.
  - Деньги конечно же!
]

#slide(title: "А как их считать?")[
  Ряд Тейлора:
  #only(1)[
    $
    f(x) = sum_(n = 0)^infinity f^('^((n)))(x_0) (x - x_0)^n
    $
  ]
  #only(2)[
    $
    arrow f(x) approx a_0 + a_1(x - x_0) 
      + a_2 (x - x_0)^2
      + a_3 (x - x_0)^3
     + epsilon
    $
  ]
]

#slide(title: "Разностная хитрость")[
  $
  P(n) = n^4, n= 1,2...
  $
  #align(center)[
    #image("figures/diff_table.png", width: 70%)
  ]
  $
  9^4 = 4096 + 1659 + 590 + 154 + 24 = 6561
  $
]

#slide(title: "Разностная хитрость")[
  $
  P(x) = x^n
  $
  $
  P(x+a) - P(x) &= (x + a)^n - x^n \
  &= x^n + C_n^1 a x^(n-1) + C_n^2 a^2 x^(n-2) + ... - x^n \
  &= b_(n-1)x^(n-1) + b_(n-2)x^(n-2) + ...
  $
]

#slide(title: "Чарльз Беббидж")[
  #side-by-side()[
     1791-1871, Англия
     - окончил Тринити-колледж
     - занимался теорией функций
     - внёс значительный вклад в металлообработку и развитие железной дороги в Великобритании

  ][
    #align(center)[
      #image("figures/CharlesBabbage.jpg")
    ]
  ]
]

#slide(title: "Разностная машина")[
  #align(center)[
    #only(1)[
      #image("figures/difference-engine.jpg")
    ]
    #only(2)[
      #image("figures/difference-engine-closeup.jpg")
    ]
    #only(3)[
      #qr("How Babbage's Difference Engine No. 2 Works",
      "diff_engine",
      "https://www.youtube.com/playlist?list=PLSOxgHhh6-o8ZuhRpL9ds8wM4doxauru-", 40%)
    ]
  ]
]

#slide(title: "Аналитическая машина")[
  #side-by-side()[
    - "мельница": сложение, вычитание, умножение
    - "контора": выбор операций
    - "склад": выбор ячеек памяти, откуда берутся данные
    - Загрузка и выгрузка данных на перфокарты
  ][
    #align(center)[
      #image("figures/analytical-engine.jpg")
    ]
  ]
]

#slide(title: "Аналитическая машина")[
    #align(center)[
      #image("figures/steampunk.png")
    ]
]

#slide(title: "Алло?")[
  У механических вычислительных машин был целый ворох недостатков:
  - Низкая скорость
  - Сложность изготовления и отладки
  - Очень низкая надежность
  - Большие габариты
  Где взять новую элементную базу?
]

#slide(title: "Алло!")[
  Электромеханические реле -- очевидная основа для создания вентилей.
    #align(center)[
      #image("figures/relay.png")
    ]
]

#slide(title: "Z1")[
    #align(center)[
      #image("figures/Z1.jpg")
    ]
]

#slide(title: "Клапан Флеминга")[
    #align(center)[
      #image("figures/flemming.png")
    ]
]

#slide(title: "Компьютер Атанасова-Берри")[
  #align(center)[
    #only(1)[
      #image("figures/abc.png")
    ]
    #only(2)[
      #image("figures/basic_block.png")
    ]
  ]
]

#slide(title: "Mark I")[
  #align(center)[
    #only(1)[
      #image("figures/MARK_I.png")
    ]
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
