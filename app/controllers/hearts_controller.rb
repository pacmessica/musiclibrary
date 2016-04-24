class HeartsController < ApplicationController
  def create
    song = Song.find( params[:song_id])
    heart = Heart.new( song: song, user: current_user)

    heart.save
  end
end
