class Song < ApplicationRecord
  paginates_per 20
  belongs_to :artist
  belongs_to :album
  belongs_to :genre
  has_many :playlist_songs
end
