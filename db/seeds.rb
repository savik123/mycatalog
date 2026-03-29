Equipment.create!(
  name: "CreatBot D600 Pro",
  purpose: "Крупноформатная 3D-печать",
  description: "Промышленный 3D-принтер",
  keywords: "3d принтер печать"
).tap do |e|
  e.images.attach(
    io: File.open(Rails.root.join("app/assets/images/equipment/creatbot.jpg")),
    filename: "creatbot.jpg"
  )
end