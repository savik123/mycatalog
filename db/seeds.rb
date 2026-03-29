puts "🚀 CREATE EQUIPMENT"

Equipment.destroy_all

equipments = [
  { name: "JET Metal Lathe BD-10VS", purpose: "Токарная обработка металла", description: "Настольный токарный станок для точной обработки металлических деталей", keywords: "станок токарный металл обработка" },

  { name: "Anycubic Photon M3 Max", purpose: "3D-печать (смола)", description: "Высокоточный 3D-принтер для печати из фотополимерной смолы", keywords: "3d принтер смола печать" },

  { name: "Element 702", purpose: "Пайка электроники", description: "Паяльная станция для ремонта и сборки электронных компонентов", keywords: "пайка электроника паяльник" },

  { name: "Creality K1 Max", purpose: "3D-печать", description: "Скоростной 3D-принтер для создания прототипов", keywords: "3d принтер пластик печать" },

  { name: "Динамометр ДЭП6-1Д-2Р-2", purpose: "Измерение силы", description: "Прибор для измерения механических нагрузок и усилий", keywords: "измерение сила нагрузка" },

  { name: "CreatBot D600 Pro", purpose: "Крупноформатная 3D-печать", description: "Промышленный 3D-принтер для печати крупных деталей", keywords: "3d принтер большой формат" },

  { name: "Bambu Lab X1 Carbon", purpose: "3D-печать", description: "Современный 3D-принтер с высокой скоростью и качеством печати", keywords: "3d принтер быстрый" },

  { name: "Texenergo", purpose: "Энергетическое оборудование", description: "Оборудование для лабораторных испытаний и электроснабжения", keywords: "электро оборудование энергия" },

  { name: "Lukey 702", purpose: "Пайка и ремонт", description: "Паяльная станция с феном для ремонта электроники", keywords: "пайка фен ремонт" },

  { name: "Epson", purpose: "Печать документов", description: "Офисный принтер для печати документов", keywords: "принтер печать офис" },

  { name: "Kyocera ECOSYS M8124cidn", purpose: "Печать документов", description: "Многофункциональное устройство для офиса", keywords: "принтер мфу офис" },

  { name: "Creality Ender", purpose: "3D-печать", description: "Популярный 3D-принтер для обучения и прототипирования", keywords: "3d принтер обучение" },

  { name: "HP LaserJet M111a", purpose: "Печать документов", description: "Компактный лазерный принтер", keywords: "принтер лазерный" },

  { name: "JET Milling Machine JMD-1L-127", purpose: "Фрезерная обработка", description: "Фрезерный станок для обработки металлических деталей", keywords: "станок фрезерный металл" },

  { name: "Milling Machine MP29S", purpose: "Фрезерная обработка", description: "Станок для обработки материалов резанием", keywords: "станок фрезеровка" },

  { name: "Remeza Air Compressor", purpose: "Подача сжатого воздуха", description: "Компрессор для пневматических систем", keywords: "компрессор воздух" },

  { name: "Makita GB801", purpose: "Шлифовка", description: "Точильный станок для обработки инструментов", keywords: "шлифовка инструмент" },

  { name: "Асинхронный двигатель PR17", purpose: "Привод механизмов", description: "Электродвигатель для лабораторных и промышленных задач", keywords: "двигатель электрический" },

  { name: "Metal Master X32100", purpose: "Металлообработка", description: "Станок для обработки металлических деталей", keywords: "станок металл" },

  { name: "Optimum D 23Pro", purpose: "Сверление", description: "Сверлильный станок для точной обработки", keywords: "станок сверлильный" },

  { name: "Proma FP-20A", purpose: "Фрезерование", description: "Станок для фрезерной обработки", keywords: "станок фрезерный" },

  { name: "Testsystems СТИ ТС 2-1200", purpose: "Испытания материалов", description: "Оборудование для испытаний прочности", keywords: "испытание нагрузка" },

  { name: "Вентилятор осевой РОВЕН", purpose: "Вентиляция", description: "Осевой вентилятор для циркуляции воздуха", keywords: "вентиляция воздух" },

  { name: "Прокатный стан Дуо-130", purpose: "Прокат металла", description: "Станок для прокатки металлических заготовок", keywords: "прокат металл" },

  { name: "JET Disc & Belt Sander JSG-64", purpose: "Шлифование", description: "Комбинированный шлифовальный станок", keywords: "шлифовка станок" }
]

equipments.each do |data|
  Equipment.create!(data)
end

puts "✅ CREATED: #{Equipment.count}"