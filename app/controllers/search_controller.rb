class SearchController < ApplicationController
  def index
    if params[:track_search].present?
      songs = Song.search(params[:track_search])
      if songs.present?
        @songs = songs
        render @songs
      else
        redirect_to artists_path, notice: "Sorry, we couldn't find anything. Try something new?"
      end
    elsif params[:artist_search].present?
      artists = Artist.search(params[:artist_search])
      if artists.present?
        @artists = artists
        render @artists
      end
    end
  end
end
