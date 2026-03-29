puts "🚀 START ATTACH IMAGES"

folder = Rails.root.join('app/assets/images/equipment')

def normalize(str)
  str.downcase.gsub(/[^a-z0-9а-яё]/i, '')
end

Dir.glob(folder.join('*')).each do |file_path|
  filename = File.basename(file_path, '.*')
  normalized_filename = normalize(filename)

  equipment = Equipment.all.find do |e|
    normalized_name = normalize(e.name)
    normalized_name.include?(normalized_filename) || normalized_filename.include?(normalized_name)
  end

  if equipment
    equipment.images.attach(
      io: File.open(file_path),
      filename: File.basename(file_path)
    )
    puts "✔ #{equipment.name} ← #{File.basename(file_path)}"
  else
    puts "❌ Не найдено: #{filename}"
  end
end

puts "✅ DONE"