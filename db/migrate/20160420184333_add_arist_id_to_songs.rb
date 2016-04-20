class AddAristIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer
    add_foreign_key :songs, :artists
  end
end
