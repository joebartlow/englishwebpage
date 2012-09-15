class Content_text < ActiveRecord::Base
  attr_accessible :body_text

  belongs_to :content

end