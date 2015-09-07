class AddDatetimeToGenre < ActiveRecord::Migration
  def change
    add_timestamps(:genres)
  end
end
