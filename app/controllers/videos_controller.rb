class VideosController < ApplicationController
  before_filter :find_video,  :only => [:show, :edit, :update, :destroy]
  before_filter :reify_video, :only => [:show, :edit]

  def index
    # if params[:query].present?
    #   @videos = Video.search(params[:query], page: params[:page])
    # else
    #   @videos = Video.all
    # end

      # The `live` scope gives us videos that aren't in the trash.
    # It's also strongly recommended that you eagerly-load the `draft` association via `includes` so you don't keep
    # hitting your database for each draft.
    @videos = Video.live.includes(:draft).order(:title)

    # Load drafted versions of each video
    @videos.map! { |video| video.draft.reify if video.draft? }

  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    # Instead of calling `save`, you call `draft_creation` to save it as a draft
    if @video.draft_creation
      flash[:success] = 'A draft of the new video was saved successfully.'
      redirect_to admin_videos_path
    else
      flash[:error] = 'There was an error creating the video. Please review the errors below and try again.'
      render :new
    end
  end

  def edit
  end

  def update
    @video.attributes = video_params

    # Instead of calling `update_attributes`, you call `draft_update` to save it as a draft
    if @video.draft_update
      flash[:success] = 'A draft of the video update was saved successfully.'
      redirect_to admin_videos_path
    else
      flash[:error] = 'There was an error updating the video. Please review the errors below and try again.'
      render :edit
    end
  end

  def destroy
    # Instead of calling `destroy`, you call `draft_destroy` to "trash" it as a draft
    @video.draft_destroy
    flash[:success] = 'The video was moved to the trash.'
    redirect_to admin_videos_path
  end

  def autocomplete
    render json: Video.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private

  # Finds non-trashed video by `params[:id]`
  def find_video
    @video = Video.live.find(params[:id])
  end

  # If the video has a draft, load that version of it
  def reify_video
    @video = @video.draft.reify if @video.draft?
  end

  # Strong parameters in Rails 4+
  def video_params
    params.require(:video).permit(:title)
  end

end
