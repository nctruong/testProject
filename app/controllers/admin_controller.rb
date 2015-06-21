class AdminController < ApplicationController

  def index

    @videos = Video.all
    @drafts = Draft.all
  end
end
