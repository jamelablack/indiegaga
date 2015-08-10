class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      :name
    end
  end
end
