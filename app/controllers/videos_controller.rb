class VideosController < ApplicationController
  before_filter :find_video,  :only => [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @videos = Video.search(params[:query], page: params[:page])
    else
      @videos = Video.all
    end
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:success] = 'A draft of the new video was saved successfully.'
      redirect_to root_path
    else
      flash[:error] = 'There was an error creating the video. Please review the errors below and try again.'
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    flash[:success] = 'The video was moved to the trash.'
    redirect_to root_path
  end

  def autocomplete
    render json: Video.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private

  def video_params
    params.require(:video).permit(:title, :url)
  end

  def find_video
    @video = Video.find(params[:id])
  end

end
