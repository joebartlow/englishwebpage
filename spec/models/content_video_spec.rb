require 'spec_helper'

describe  "content video" do
  it "should respond to video_uri" do
    content_video = ContentVideo.create(:video_uri => 'video')

    content_video.should respond_to(:video_uri)
  end
end