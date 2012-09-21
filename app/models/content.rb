class Content < ActiveRecord::Base
  attr_accessible :page_id,
                  :title,
                  :subtitle,
                  :page_order,
                  :page_type

  has_many :content_texts
  has_many :content_images
  has_many :content_videos


end