class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, :song_url
      t.integer :album_id
    end
  end
end
