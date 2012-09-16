require 'spec_helper'

describe BasesController do
  describe "#create" do
    it 'should add a new post to the database' do
      post :create, :title => 'title0', :subtitle => 'subtitle0', :page_id => 'page0'

      response.should be_success
      content = Content.last
      content[:title].should == "title0"
      content[:subtitle].should == "subtitle0"
      content[:page_id].should == "page0"
    end
    it 'should add a single content text blob to the post' do
      post :create, :title => 'title1', :subtitle => 'subtitle1', :page_id => 'page01', :content_text => 'some awesome text about stuff'

      response.should be_success
      content = Content.last
      content.content_texts.first[:body_text].should == "some awesome text about stuff"
    end
  end
end