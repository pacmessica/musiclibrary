Song.destroy_all
Album.destroy_all
Artist.destroy_all


artists = ["Frank Sinatra", "Nirvana", "Ben Folds", "Ween", "Better Than Ezra", "Porcupine Tree"]

artists.each do |name|
  Artist.create(name: name)
end

albums = {}

albums["Ween"] = [
  ["Chocolate and Cheese",
  "ChocolateandCheese.jpg",
  1994],

  ["The Mollusk",
    "TheMollusk.jpg",
  1997]
]

albums["Ben Folds"] = [
  [ "Songs for Silverman",
    "SongsForSilverman.jpg",
    2005]
]

albums.each do | album_artist, album_info |
  if artist = Artist.find_by( name:album_artist)
  else
    artist = Artist.create( name:album_artist)
  end
  album_info.each do | name, cover, year |
    Album.create( name:name, cover:cover, year:year, artist_id:artist.id)
  end
end

songs = {}

songs["Songs for Silverman"] =
  "Bastard, You to Thank, Jesusland, Landed, Gracie, Trusted, Give Judy My Notice, Late, Sentimental Guy, Time, Prison Food"

songs["Chocolate and Cheese"] =
  "Take me Away, Drifter in the Dark, Voodoo Lady, Joppa Road"

songs["The Mollusk"] =
  "The Mollusk, Polka Dot Tail, Mutilated Lips, Buckingham Green, Ocean Man, Waving my Dick in the Wind"


songs.each do | album_name, song_list |
  album = Album.find_by( name:album_name)
  song_list.split(", ").each do | title |
    Song.create( title:title, album_id:album.id, artist_id:album.artist_id )
  end
end
