puts "🚀 CREATE EQUIPMENT"

Equipment.destroy_all
equipments = [
  { name: "JET Metal Lathe BD-10VS", purpose: "Токарная обработка металла", description: "Настольный токарный станок", keywords: "станок токарный металл" },
  { name: "Anycubic Photon M3 Max", purpose: "3D-печать (смола)", description: "3D-принтер для печати из фотополимерной смолы", keywords: "3d принтер смола" },
  { name: "Element 702", purpose: "Пайка электроники", description: "Паяльная станция", keywords: "пайка электроника" },
  { name: "Creality K1 Max", purpose: "3D-печать", description: "Скоростной 3D-принтер", keywords: "3d принтер" },
  { name: "Динамометр ДЭП6-1Д-2Р-2", purpose: "Измерение силы", description: "Прибор для измерения нагрузок", keywords: "измерение сила" },
  { name: "CreatBot D600 Pro", purpose: "Крупноформатная 3D-печать", description: "Промышленный 3D-принтер", keywords: "3d принтер большой" },
  { name: "Bambu Lab X1 Carbon", purpose: "3D-печать", description: "Современный 3D-принтер", keywords: "3d принтер быстрый" },
  { name: "Texenergo", purpose: "Энергетическое оборудование", description: "Оборудование для электроснабжения", keywords: "электро энергия" },
  { name: "Lukey 702", purpose: "Пайка и ремонт", description: "Паяльная станция с феном", keywords: "пайка ремонт" },
  { name: "Epson", purpose: "Печать документов", description: "Офисный принтер", keywords: "принтер печать" },
  { name: "Kyocera ECOSYS M8124cidn", purpose: "Печать документов", description: "МФУ", keywords: "принтер мфу" },
  { name: "Creality Ender", purpose: "3D-печать", description: "3D-принтер", keywords: "3d принтер обучение" },
  { name: "HP LaserJet M111a", purpose: "Печать документов", description: "Лазерный принтер", keywords: "принтер лазерный" },
  { name: "JET Milling Machine JMD-1L-127", purpose: "Фрезерная обработка", description: "Фрезерный станок", keywords: "станок фрезерный" },
  { name: "Milling Machine MP29S", purpose: "Фрезерная обработка", description: "Станок", keywords: "станок фрезеровка" },
  { name: "Remeza Air Compressor", purpose: "Сжатый воздух", description: "Компрессор", keywords: "компрессор воздух" },
  { name: "Makita GB801", purpose: "Шлифовка", description: "Точильный станок", keywords: "шлифовка" },
  { name: "Асинхронный двигатель PR17", purpose: "Привод", description: "Электродвигатель", keywords: "двигатель" },
  { name: "Metal Master X32100", purpose: "Металлообработка", description: "Станок", keywords: "станок металл" },
  { name: "Optimum D 23Pro", purpose: "Сверление", description: "Сверлильный станок", keywords: "сверление" },
  { name: "Proma FP-20A", purpose: "Фрезерование", description: "Фрезерный станок", keywords: "фрезерование" },
  { name: "Testsystems СТИ ТС 2-1200", purpose: "Испытания", description: "Испытательное оборудование", keywords: "испытание" },
  { name: "Вентилятор осевой РОВЕН", purpose: "Вентиляция", description: "Осевой вентилятор", keywords: "вентиляция" },
  { name: "Прокатный стан Дуо-130", purpose: "Прокат металла", description: "Прокатный стан", keywords: "прокат металл" },
  { name: "JET Disc & Belt Sander JSG-64", purpose: "Шлифование", description: "Шлифовальный станок", keywords: "шлифовка станок" }
]

equipments.each do |data|
  Equipment.create!(data)
end

puts "✅ CREATED: #{Equipment.count}"

# =========================
# 📸 АВТО-ПОДБОР КАРТИНОК
# =========================

puts "🖼 ATTACH IMAGES"

folder = Rails.root.join('app/assets/images/equipment')

def normalize_words(str)
  str.downcase.gsub(/[^a-z0-9а-яё\s]/i, '').split
end

mapping = {
  "proma" => "Proma FP-20A",
  "roven" => "Вентилятор осевой РОВЕН",
  "jetdisc" => "JET Disc & Belt Sander JSG-64",
  "texenergo" => "Texenergo",
  "duo130" => "Прокатный стан Дуо-130",
  "sti" => "Testsystems СТИ ТС 2-1200"
}

Dir.glob(folder.join('*')).each do |file_path|
  filename = File.basename(file_path, '.*')

  mapped = mapping.find { |key, _| filename.downcase.include?(key) }

  if mapped
    equipment = Equipment.find_by(name: mapped[1])
  else
    file_words = normalize_words(filename)

    equipment = Equipment.all.find do |e|
      name_words = normalize_words(e.name)
      (file_words & name_words).any?
    end
  end


  if equipment
    unless equipment.images.attached?
      equipment.images.attach(
        io: File.open(file_path),
        filename: File.basename(file_path)
      )
      puts "✔ #{equipment.name} ← #{File.basename(file_path)}"
    end
  else
    puts "❌ Не найдено: #{filename}"
  end
end

puts "🎉 DONE"