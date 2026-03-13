class AddVideoLinkToVideos < ActiveRecord::Migration[8.1]
  def change
    add_column :videos, :video_link, :string
  end
end
