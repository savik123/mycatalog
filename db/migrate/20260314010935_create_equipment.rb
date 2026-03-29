class CreateEquipment < ActiveRecord::Migration[8.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :purpose
      t.text :application
      t.text :description
      t.text :recommendations

      t.timestamps
    end
  end
end
