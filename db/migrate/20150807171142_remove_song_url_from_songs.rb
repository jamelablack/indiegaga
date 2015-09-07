class RemoveSongUrlFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :song_url, :string
    add_column :songs, :url, :string
    add_column :songs, :track, :integer
  end
end
