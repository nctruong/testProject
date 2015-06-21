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

  def autocomplete
    render json: Video.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

end
