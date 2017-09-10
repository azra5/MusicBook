class Song < ApplicationRecord
  paginates_per 20
  belongs_to :artist
  belongs_to :album
  belongs_to :genre
  has_many :playlist_songs

  scope :search, -> (search) { where('name LIKE ?', "%#{search}%").order(:created_at) }

  scope :trending, -> (top) {joins("INNER JOIN favourites ON favourites.song_id = songs.id").group("songs.id").order("count(favourites.song_id) desc").take(top)}

end
