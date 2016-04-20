class AddAlbumIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :album_id, :integer
    add_foreign_key :songs, :albums
  end
end
