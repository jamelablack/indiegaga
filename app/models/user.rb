class User < ActiveRecord::Base
  include Tokenable

  has_many :reviews, -> {order("created_at DESC")}
  has_many :playlist_items, ->{ order(:position) }
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id
  has_many :fan_relationships, class_name: "Fav", foreign_key: :fan_id

  validates_presence_of :email, :password, :full_name
  validates_uniqueness_of :email
  has_secure_password validations: false



  def normalize_playlist_item_positions
    playlist_items.each_with_index do |playlist_item, index|
      playlist_item.update_attributes(position: index+1)
    end
  end

  def queued_song?(song)
    playlist_items.map(&:song).include?(song)
  end

  def follows?(another_user)
    following_relationships.map(&:leader).include?(another_user)
  end

  def can_follow?(another_user)
    !(self.follows?(another_user) || self == another_user)
  end

  def follow(another_user)
    following_relationships.create(leader: another_user) if can_follow?(another_user)
  end

  def deactivate!
    update_column(:active, false)
  end
end
