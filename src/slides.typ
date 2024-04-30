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
    - Обязательная авторизация
  ]
]

#slide(title: "Новая модель приватности")[
  #align(center)[
    #image("img/privacy-model.svg", width: 100%)
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

#focus-slide[
  Часть 2: Криптографический ликбез
]

#slide(title: "Односторонние функции")[
  $
  y = f(x) &<- #[Вычисляется _легко_]\
  x = f^(-1)(y) &<- #[Не существует или вычисляется _сложно_]
  $
]

#slide(title: "Односторонние функции: примеры")[
  #line-by-line()[
    - *Умножение:* $c = a b$ -- легко, но  $(a,b) = f(c)$ -- трудно
    - *Возведение в степень:* $c = a^b$ -- легко, но $b = log_a (c)$ -- трудно
  ]
]

#set quote(block: true)
#slide(title: "Хеш-функции")[
  #quote(attribution: "Википедия")[Хеш-функция -- функция, преобразующая массив входных данных произвольного размера в выходную битовую строку фиксированного размера.]
  #pause
  $ h(x) = x mod N, #[где $N$ -- простое число] $
]
#slide(title: "Хеш-функции: свойства")[
  - *Коллизия* -- пара входных значений $m$ и $m'$, такие что $h(m) = h(m')$
  #pause
  - *Лавинный эффект* -- малое изменение входных данных полностью изменяет значение хеш-функции
]

// Надо бы что-то сказать про лавинный эффект
#slide(title: "Требования к криптографическим хеш-функциям")[
  #line-by-line[
    - *Сопротивление поиску прообраза:* для значения хэша $x$ должно быть трудно найти $m$ такое, что $x = h(m)$
    - *Сопротивление поиску второго прообраза:* для $m_1$ должно быть сложно найти $m_2$ такое, что: $h(m_1) = h(m_2)$
    - *Стойкость к поиску коллизий:* должно быть сложно найти $m$, $m'$ такие, что $h(m)=h(m')$
  ]
]
#slide(title: "Цифровая подпись")[
  #quote(attribution: "Wikipedia(en)")[
    *Цифровая подпись* -- метод подтверждения подлинности цифрового сообщения.
    Подтвержденная цифровая подпись доказывает, что сообщение пришло от отправителя, а не кого-то другого.
  ]
]
#slide(title: [Односторонняя функция с _секретом_])[
  - $f_(S) (m) = c$ _легко_ вычислить без знания _секрета_
  - $f^(-1)_(S)(c) = m$ -- _сложно_
  - $f^(-1)_(S)(c) = m$ -- _легко_
]

#slide(title: "Цифровая подпись: общая схема")[
  #line-by-line[
    - *Генерация ключей:* С помощью генератора случаных чисел создаются открытый ($P$) и закрытый ($S$) ключи
    - *Публикация открытого ключа*
    - *Подписывание сообщений с использованием закрытого ключа*
  ]
]

#focus-slide[
  Часть 3: Блокчейн (наконец-то)
]

#slide(title: "Проблемы, которые надо решить")[
    - Подтверждение личности отправителя
    - Проверка наличия средств у отправителя
    - Невозможность тратить одни и те же деньги несколько раз
]

#slide(title: "Цепочка транзакций")[
  #align(center)[
    #rect(fill: gray)[
      #image("img/transaction-chain.svg", width: 70%)
    ]
  ]
]

#slide(title: "Устройство транзакции")[
  #only(1)[
    #rect(fill: gray)[
      #image("img/transaction.svg", width: 100%)
    ]
  ]
  #only(2)[
    #side-by-side[
      #rect(fill: gray)[
        #image("img/block-chain.svg", width: 100%)
      ]
    ][
      - $sum "In" = sum "Out"$
      - Биткоины из входных транзакций полностью переводятся в выходные
      - Для "сдачи" адрес отправителя включается в _выходы_ транзакции
    ]
  ]
]

#slide(title: "Цепочка блоков")[
  #align(center)[
      #rect(fill: gray)[
        #image("img/block-chain.svg", width: 100%)
      ]
    ]
]

#slide(title: "Proof of work")[
  *Идея:* сделаем так, чтобы создавать блоки было вычислительно трудно.
  #pause
  - Добавим в блок поле *Nounce*(_англ._ соль), значение которого может быть любым
  - Потребуем, чтобы значение хеша блока удовлетворяло некоторому условию
]

#slide(title: "Устройство блока")[
  #align(center)[
      #table(
        columns: (auto, auto),
        inset: 10pt,
        stroke: white,
        align: horizon,
        table.header(
          [*Поле*], [*Значение*],
        ),
        "Prev Hash", "Хеш предыдущего блока",
        "Nonce", "Значение, которое нужно подобрать",
        "Difficulty (не показано)", "количество нулей, которое должно быть у хеша этого блока",
        "Tx1, Tx2...", "Транзакции, которые включены в этот блок",
      )
  ]
]

#slide(title: "Хранение списка транзакций")[
  #align(center)[
    #side-by-side[
      #image("img/merkle-full.svg", width: 70%)
    ][
      #image("img/merkle-cut.svg", width: 70%)
    ]
  ]
]

#slide(title: "А если цепочка раздвоится?")[
  #align(center)[
    #rotate(90deg, origin: center, reflow: true)[
      #rect(fill: gray)[
        #image("img/sidechains.svg", width: 100%)
      ]
    ]
  ]
]

#slide(title: "Ссылки", footer: clickable-qrs-footer)[
  #set align(center + horizon)
  #stack(dir: ltr, spacing: 5%,
  qr("На меня", "totikom", "https://totikom.github.io/", 30%),
  qr([На канал "Леса"], "forest", "https://t.me/forest_school_am", 30%),
  qr([На "ФизЛес"], "fiz_forest" ,"https://t.me/physicists_in_the_forest", 30%),
]
