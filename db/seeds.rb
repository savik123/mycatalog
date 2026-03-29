require 'open-uri'

folder = Rails.root.join('db', 'images')

Dir.glob(folder.join('*')).each do |file_path|
  filename = File.basename(file_path, '.*')

  equipment = Equipment.find_by("LOWER(name) LIKE ?", "%#{filename.downcase}%")

  if equipment
    equipment.images.attach(
      io: File.open(file_path),
      filename: File.basename(file_path)
    )
    puts "✔ #{equipment.name}"
  else
    puts "❌ Не найдено: #{filename}"
  end
end