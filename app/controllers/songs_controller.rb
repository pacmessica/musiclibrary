class SongsController < ApplicationController
  def index
    @songs = Song.order(title: :asc)
  end

  def show
  end
end
