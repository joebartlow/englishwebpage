class BasesController < ApplicationController
  def create
    content = Content.create(
        :title => params[:title],
        :subtitle => params[:subtitle],
        :page_id => params[:page_id],
        :page_order => params[:page_order],
        :page_type => params[:page_type]
    )

    if content.page_type == 'normal'
      if params[:content_text]
        content_array = JSON.parse(params[:content_text])
        content_array.each do |text|
          content.content_texts.create(
              :body_text => text['text']
          )
        end
      end

      if params[:content_image]
        image_array = JSON.parse(params[:content_image])
        image_array.each do |image|
          content.content_images.create(
              :image_uri => image['image_uri']
          )
        end
      end
    else
      if params[:content_video]
        video_array = JSON.parse(params[:content_video])
        video_array.each do |video|
          content.content_videos.create(
              :video_uri => video['video_uri']
          )
        end
      end
    end
    render :nothing => true
  end
  def index
    @content = Content.find_by_page_order(0)
    @page_list = []
    Content.all.sort_by{|i| i.page_order}.map{|i| @page_list << {:page_id => i.page_id, :title => i.title, :page_order => i.page_order}}
    respond_to do |format|
      format.html
    end
  end
  def show
    @content = Content.find_by_page_id(params[:id])
    @max = Content.maximum("page_order")
    @page_list = []
    Content.all.sort_by{|i| i.page_order}.map{|i| @page_list << {:page_id => i.page_id, :title => i.title, :page_order => i.page_order}}
    respond_to do |format|
      format.html
    end
  end
  def show_by_page_order
    @content = Content.find_by_page_order(params[:page_order])
    @max = Content.maximum("page_order")
    @page_list = []
    Content.all.sort_by{|i| i.page_order}.map{|i| @page_list << {:page_id => i.page_id, :title => i.title, :page_order => i.page_order}}
    render :show
  end
end