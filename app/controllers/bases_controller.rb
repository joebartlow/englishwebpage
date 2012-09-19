class BasesController < ApplicationController
  def create
    content = Content.create(
        :title => params[:title],
        :subtitle => params[:subtitle],
        :page_id => params[:page_id]
    )

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
    render :nothing => true
  end
  def index
    @content = Content.first
    respond_to do |format|
      format.html
    end
  end
  def show
    @content = Content.find_by_page_id(params[:id])
    respond_to do |format|
      format.html
    end
  end
end