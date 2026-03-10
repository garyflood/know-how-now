class CreateDevices < ActiveRecord::Migration[8.1]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.text :text_instructions, null: false
      t.string :images, array: true, default: []   # PostgreSQL native array
      t.integer :views, null: false, default: 0
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
