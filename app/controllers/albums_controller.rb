class AlbumsController < ApplicationController
  def index
    @albums = Album.order(year: :asc)
  end

  def show
    @album = Album.find( params[:id] )
  end
end
