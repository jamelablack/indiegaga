class Favs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.integer :artist_leader_id
      t.integer :user_fan_id
      t.timestamps
    end
  end
end
