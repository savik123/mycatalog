class AddKeywordsToEquipment < ActiveRecord::Migration[8.1]
  def change
    add_column :equipment, :keywords, :text
  end
end
