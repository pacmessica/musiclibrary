class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs

  def self.search(search)
    where("name iLIKE ?", "%#{search}%")
  end
end
