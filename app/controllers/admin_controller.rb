class AdminController < ApplicationController

  def index

    @videos = Video.all
    @draftVideos = DraftVideo.all
  end
end
