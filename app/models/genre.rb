class Genre < ActiveRecord::Base
  has_many :albums

  def recent_artists
    artists.first(6)
  end
end
