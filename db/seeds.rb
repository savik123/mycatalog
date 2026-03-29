puts "🚀 SEED START"

Equipment.destroy_all

Equipment.create!(
  name: "CreatBot D600 Pro",
  purpose: "Крупноформатная 3D-печать",
  description: "Промышленный 3D-принтер",
  keywords: "3d принтер печать"
)

Equipment.create!(
  name: "Epson",
  purpose: "Печать документов",
  description: "Офисный принтер",
  keywords: "принтер печать"
)

puts "✅ CREATED: #{Equipment.count}"