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
      post :create, :title => 'title1', :subtitle => 'subtitle1', :page_id => 'page01', :content_text => [{:text => 'some awesome text about stuff'}].to_json

      response.should be_success
      content = Content.last
      content.content_texts.first[:body_text].should == "some awesome text about stuff"
    end
    it 'should add multiple content text blobs to the post' do
      post :create, :title => 'title2', :subtitle => 'subtitle2', :page_id => 'page2', :content_text => [{:text =>'text number 1'}, {:text => 'text number 2'}, {:text =>'somemore text'}].to_json

      response.should be_success
      content = Content.last
      content.content_texts.first[:body_text].should == "text number 1"
      content.content_texts.last[:body_text].should == "somemore text"
    end
    it 'should add a single image uri in the post' do
      post :create, :title => 'title3', :subtitle => 'subtitle3', :page_id => 'page3', :content_image => [{:image_uri => 'uri3'}].to_json
      response.should be_success
      content =Content.last
      content.content_images.first[:image_uri].should == "uri3"
    end
    it 'should add multiple image uris to the post' do
      post :create, :title => 'title4', :subtitle => 'subtitle4', :page_id => 'page4', :content_image => [{:image_uri =>'image4'}, {:image_uri =>'image5'}, {:image_uri =>'image6'}].to_json

      response.should be_success
      content = Content.last
      content.content_images.first[:image_uri].should == "image4"
      content.content_images.last[:image_uri].should == "image6"
      content.content_images.count.should == 3
    end
    it 'should have both image uris and text in the post' do
      post :create, :title => 'title4', :subtitle => 'subtitle4', :page_id => 'page4', :content_image => [{:image_uri =>'image4'}, {:image_uri =>'image5'}, {:image_uri =>'image6'}].to_json, :content_text => [{:text =>'text number 1'}, {:text => 'text number 2'}, {:text =>'somemore text'}].to_json

      response.should be_success
      content = Content.last
      content.content_images.first[:image_uri].should == "image4"
      content.content_images.last[:image_uri].should == "image6"
      content.content_images.count.should == 3

      content.content_texts.first[:body_text].should == "text number 1"
      content.content_texts.last[:body_text].should == "somemore text"
      content.content_texts.count.should == 3
    end
  end

  describe "#index" do
    it 'should grab content from the database and pass it back' do
      post :create, :title => 'title4', :subtitle => 'subtitle4', :page_id => 'page4', :content_image => [{:image_uri =>'image4'}, {:image_uri =>'image5'}, {:image_uri =>'image6'}].to_json, :content_text => [{:text =>'text number 1'}, {:text => 'text number 2'}, {:text =>'somemore text'}].to_json

      response.should be_success

      get :index
      response.should be_success
      ourcontent = Content.first

      assigns(:content).should_not be_nil
      assigns(:content).should == ourcontent
      assigns(:content).content_images.first[:image_uri].should == "image4"
      assigns(:content).content_texts.first[:body_text].should == "text number 1"

    end
  end

  describe "#show" do
    it 'should grab a specific page_id and return that data' do
      post :create, :title => 'title4', :subtitle => 'subtitle4', :page_id => 'page4', :content_image => [{:image_uri =>'image4'}, {:image_uri =>'image5'}, {:image_uri =>'image6'}].to_json, :content_text => [{:text =>'text number 1'}, {:text => 'text number 2'}, {:text =>'somemore text'}].to_json
      response.should be_success
      post :create, :title => 'title5', :subtitle => 'subtitle5', :page_id => 'page5', :content_image => [{:image_uri =>'image7'}, {:image_uri =>'image8'}, {:image_uri =>'image9'}].to_json, :content_text => [{:text =>'text number 11'}, {:text => 'text number 12'}, {:text =>'somemore text 13'}].to_json
      response.should be_success

      get :show, :id => 'page4'
      response.should be_success
      assigns(:content).should_not be_nil
      assigns(:content).content_images.first[:image_uri].should == "image4"
      assigns(:content).content_texts.first[:body_text].should == "text number 1"
    end
  end
end