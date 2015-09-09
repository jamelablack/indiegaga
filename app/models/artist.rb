class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :albums
  has_many :reviews, -> { order(created_at: :desc) }
  has_many :fav_relationships, class_name: "Fav", foreign_key: :icon_id

  mount_uploader :large_cover, LargeCoverUploader
  mount_uploader :small_cover, SmallCoverUploader

  validates_presence_of :name, :bio, :website, :year_created

  def self.search_by_name(search_term)
    return [] if search_term.blank?
    where("name ILIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def rating
    reviews.average(:rating).round(1) if reviews.average(:rating)
  end

end
