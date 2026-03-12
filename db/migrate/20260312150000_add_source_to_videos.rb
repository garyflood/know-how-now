# frozen_string_literal: true

class AddSourceToVideos < ActiveRecord::Migration[8.1]
  def change
    add_column :videos, :source, :string
  end
end
