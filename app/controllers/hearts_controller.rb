class HeartsController < ApplicationController
  def create
    song = Song.find( params[:song_id])
    if heart = Heart.find_by( song: song, user: current_user )
         heart.destroy
    else
       heart = Heart.new( song: song, user: current_user )
       heart.save
    end
    redirect_to(:back)
  end
end
