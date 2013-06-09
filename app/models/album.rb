class Album < ActiveRecord::Base
  attr_accessible :albumID, :image_thumb, :title
  has_many :photos

end
