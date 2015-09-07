class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :user_id, :album_id
      t.timestamps
    end
  end
end
