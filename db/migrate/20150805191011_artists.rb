class Artists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, :website, :merchandise, :large_cover, :small_cover, :video_url
      t.text :bio
      t.integer :year_created, :genre_id
      t.timestamps
    end
  end
end
