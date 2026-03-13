class RemoveScriptAndTagsFromVideos < ActiveRecord::Migration[8.1]
  def change
    remove_column :videos, :script, :text
    remove_column :videos, :tags, :string, array: true, default: []
  end
end
