class ContentVideo < ActiveRecord::Base
  attr_accessible :video_uri

  belongs_to :content

end