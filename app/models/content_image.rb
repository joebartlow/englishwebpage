class Content_image < ActiveRecord::Base
  attr_accessible :image_uri

  belongs_to :content

end