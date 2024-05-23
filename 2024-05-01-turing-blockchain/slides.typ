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
    #image("figures/coins.jpg", width: 100%)
  ][
    #uncover("2-")[
      #image("figures/cheque.jpg", width: 100%)
    ]
  ]
]

#slide(title: "Компьютерные системы и Интернет")[
  #side-by-side[
    #align(center)[
      #uncover("2-")[
        #text(4em)[???]
      ]
    ]
  ][
    #image("figures/card.png", width: 100%)
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
    - Приватность
  ]
]

#slide(title: "Новая модель приватности")[
  #align(center)[
    #rect(fill: gray)[
      #image("figures/privacy-model.svg", width: 100%)
    ]
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
    #image("figures/cheque.jpg", width: 100%)
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

// TODO: Добавить картинку
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
      #image("figures/transaction-chain.svg", width: 70%)
    ]
  ]
]

#slide(title: "Устройство транзакции")[
  #only(1)[
    #rect(fill: gray)[
      #image("figures/transaction.svg", width: 100%)
    ]
  ]
  #only(2)[
    #side-by-side[
      #rect(fill: gray)[
        #image("figures/transaction.svg", width: 100%)
      ]
    ][
      - $sum "In" = sum "Out"$
      - Биткоины из входных транзакций полностью переводятся в выходные
      - Для "сдачи" адрес отправителя включается в _выходы_ транзакции
    ]
  ]
]

#slide(title: "Цепочка транзакций")[
  #align(center)[
    #rect(fill: gray)[
      #image("figures/transaction-chain.svg", width: 70%)
    ]
  ]
]

#slide(title: "Цепочка блоков")[
  #align(center)[
    #rect(fill: gray)[
      #image("figures/block-chain.svg", width: 100%)
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
      "Timestamp (не показано)", "Время генерации этого блока",
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
      #image("figures/merkle-full.svg", width: 70%)
    ][
      #image("figures/merkle-cut.svg", width: 70%)
    ]
  ]
]

#slide(title: "А если цепочка раздвоится?")[
  #align(center)[
    #rotate(90deg, origin: center, reflow: true)[
      #rect(fill: gray)[
        #image("figures/sidechains.svg", width: 100%)
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
)
]

#focus-slide[
  Bonus: Как всё-таки работает цифровая подпись?
]

#slide(title: "Эллиптические кривые")[
  #side-by-side[
    - $y^2=x^3+a x+b$
    - $Delta = -16 (4 a^3 +27 b^2) != 0$
  ][
    #rect(fill: gray)[
      #image("figures/EC.svg", width: 100%)
    ]
  ]
]

#slide(title: "Эллиптические кривые: закон сложения точек")[
  #rect(fill: gray)[
    #image("figures/EC-addition.svg", width: 100%)
  ]
]

#slide(title: "Эллиптические кривые: закон сложения точек")[
  Пусть $P = (x_P, y_P)$ и $Q = (x_Q, y_Q)$ -- точки  на кривой.

  Допустим, что $x_P !=  x_Q$ и пусть $s = (y_P − y_Q)/(x_P − x_Q)$

  Тогда $R = P + Q = (x_R, y_R)$:
  $
  x_R &= s^2 - x_P - x_Q\
  y_R &= − y_P + s (x_P − x_R)
  $
]

#slide(title: "Эллиптические кривые: закон сложения точек")[
  Если $x_P = x_Q$:
  - $y_P = − y_Q => P + Q = O$ -- по определению.
  - $y_P = y_Q != 0$, тогда $P + Q = 2P = (x_R, y_R)$:
  $
  s &= (3 x_(P)^2 + a)/(2 y_P)\
  x_R &= s^2 − 2 x_P\
  y_R &= − y_P + s (x_P − x_R)
  $
  Если $y_P = y_Q = 0$ то $P + P = O$
]

#slide(title: "Алгоритм ECDSA")[
  Параметры алгоритма:
  - Эллиптическая кривая $y^2 = x^3 + 486662 x^2+x$ над $\GF(2^255 - 19)$
  - Точка G с координатой $x = 9$
  - Порядок группы, образуемой точкой: $n = 2^252 + 27742317777372353535851937790883648493$
  (Curve25519)
]

#slide(title: "Алгоритм ECDSA: создание секретного ключа")[
  + Выбрать случайное число $d$ в интервале $[0, n-1]$
  + Вычислить $Q = d times G$
  Закрытый ключ: $(d, Q)$

  Открытый ключ: $Q$
]

#slide(title: "Алгоритм ECDSA: подпись сообщения")[
  #line-by-line()[
    1. Хешировать сообщение $e = h(m)$
    2. Взять  $z = e_(L..0)$, где $L$ - битовая длина $n$.
    3. Выбрать криптографически случайное число $k in [0, n - 1]$
    4. Вычислить $(x_1,y_1)= k times G$
    5. Вычислить $r=x_1 mod n$, если $r = 0$, вернуться к шагу 3.
    6. Вычислить $s=k^(-1)(z + r d) mod n$, если $s = 0$, вернуться к шагу 3.
  ]
  #uncover("7-")[
    Подписью сообщения будет пара $(r, s)$
  ]
]

#slide(title: "Алгоритм ECDSA: проверка подписи")[
  #line-by-line()[
    1. Хешировать сообщение $e = h(m)$
    2. Взять  $z = e_(L..0)$, где $L$ - битовая длина $n$.
    3. Вычислить $u_1= z s^(-1) mod n$ и $u_2= r s^(-1) mod n$
    4. Вычислить $C = (x_2, y_2) = u_1 times G + u_2 times Q$, если $(x_2,y_2) = O$, то подпись недействительна.
  ]
  #uncover("5-")[
    Подпись верна, если $r = x_2 mod n$
  ]
]

#focus-slide[
  Почему это работает?
]

#slide(title: "Алгоритм ECDSA: доказательство корректности")[
  #line-by-line()[
    1. $С = u_1 times G + u_2 times Q$
    2. $С = u_1 times G + u_2 d times G$
    3. $С = (u_1 + u_2 d) times G$
    4. $С = (z s^(-1) + r s^(-1) d) times G$
    5. $С = (z  + r d)s^(-1) times G$
    6. $С = (z  + r d) k/(z + r d) times G$
    7. $С = k times G = (x_2, y_2)$
  ]
  #uncover("7-")[
    При этом $r = x_1$, $(x_1,y_1) = k times G$, а проверка подписи заключалась в $r = x_2 mod n$
  ]
]

#slide(title: [Почему $k$ должно быть случайным?])[
  Допустим, одно и то же $k$ использовалось для двух подписей $(r,s)$ и $(r,s')$ известных сообщений $m$ и $m'$.
  #line-by-line(start: 2)[
    1. $z$ и $z'$ известны $=> k = (z - z')/(s - s')$
    2. $s = k^(-1)(z + r d) => d = (s k  - z) / r$
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
