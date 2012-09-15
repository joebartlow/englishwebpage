require 'spec_helper'

describe  "content image" do
  it "should respond to image_uri" do
    content_image = ContentImage.create(:image_uri => 'intro')

    content_image.should respond_to(:image_uri)
  end
end