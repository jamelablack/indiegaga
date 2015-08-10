class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  validates_presence_of :rating, :content
end
