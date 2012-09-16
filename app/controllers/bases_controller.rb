class BasesController < ApplicationController
  def create
    content = Content.create(
        :title => params[:title],
        :subtitle => params[:subtitle],
        :page_id => params[:page_id]
    )
    if params[:content_text]
      content.content_texts.create(
          :body_text => params[:content_text]
      )
    end
    render :nothing => true
  end
end