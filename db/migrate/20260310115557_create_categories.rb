class CreateCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.timestamps
    end
  end
end
