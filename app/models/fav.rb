class Fav < ActiveRecord::Base
  belongs_to :fan, class_name: "User"
  belongs_to :icon, class_name: "Artist"
end
