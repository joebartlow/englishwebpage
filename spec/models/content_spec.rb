require 'spec_helper'

describe "content" do
  before do

    @content = Content.create(:page_id => 'intro',:title => 'begining', :subtitle => 'next')
  end
  it "should respond to title subtitle page id" do

    @content.should respond_to(:page_id)
    @content.should respond_to(:title)
    @content.should respond_to(:subtitle)
  end
  it "should have many content texts" do
    @content.should respond_to(:content_texts)
  end
  it "should have many content images" do
    @content.should respond_to(:content_images)
    end
end