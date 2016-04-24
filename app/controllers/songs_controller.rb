class SongsController < ApplicationController
  def index
    @songs ||= Song.includes(:artist, :album).order(title: :asc)
    if params[:track_search].present?
      songs = Song.search(params[:track_search])
      if songs.present?
        @songs = songs
      else
        redirect_to artists_path, notice: "Sorry, we couldn't find anything. Check out one of these?"
      end
    elsif params[:artist_search].present?
      artists = Artist.search(params[:artist_search])
      if artists.present?
        @songs = @songs.joins(:artist).where("artists.name iLIKE ?", "%#{params[:artist_search]}%")
      else
        redirect_to artists_path, notice: "Sorry, we couldn't find anything. Check out one of these?"
      end
    end
  end
end
