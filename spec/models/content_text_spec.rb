require 'spec_helper'

describe  "content text" do
  it "should respond to body text" do
    content_text = Content_text.create(:body_text => 'intro')

    content_text.should respond_to(:body_text)
  end
  end