class VideosController < ApplicationController


  def index
    if params[:query].present?
      @videos = Video.search(params[:query], page: params[:page])
    else
      @videos = Video.all
    end
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
