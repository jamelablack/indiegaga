class CreatePlaylistItems < ActiveRecord::Migration
  def change
    create_table :playlist_items do |t|
      t.integer :song_id, :user_id, :position
      t.timestamps
    end
  end
end
