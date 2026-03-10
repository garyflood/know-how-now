class CreateVideos < ActiveRecord::Migration[8.1]
  def change
    create_table :videos do |t|
      t.string :summary, null: false
      t.string :tags, array: true, default: [], null: false   # PostgreSQL native array
      t.text :script, null: false
      t.integer :views, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.timestamps
    end
    add_index :videos, :device_id, unique: true, if_not_exists: true  # enforces one-to-one with Device
  end
end
