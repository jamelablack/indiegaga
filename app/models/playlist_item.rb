class PlaylistItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  delegate :title, to: :song
  delegate :album, to: :song, prefix: :song
  delegate :genre, to: :song

  validates_numericality_of :position, {only_integer: true}

  def genre_name
    album.genre.name
  end

end
