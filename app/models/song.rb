class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  has_one :album_artist, through: :album, source: :artist
  has_many :hearts

  def self.search(search)
    where("title iLike ?", "%#{search}%")
  end
end
