class RemoveAlbumCoverFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :album_coverr, :string
    add_column :albums, :cover, :string
  end
end
