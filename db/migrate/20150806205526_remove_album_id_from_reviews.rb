class RemoveAlbumIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :album_id, :integer
    add_column :reviews, :artist_id, :integer
  end
end
