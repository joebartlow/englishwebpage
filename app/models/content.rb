class Content < ActiveRecord::Base
  attr_accessible :page_id,
                  :title,
                  :subtitle

  has_many :content_texts
  has_many :content_images


end