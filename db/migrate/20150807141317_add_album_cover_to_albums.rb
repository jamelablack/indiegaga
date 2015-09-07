class AddAlbumCoverToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :album_coverr, :string
  end
end
