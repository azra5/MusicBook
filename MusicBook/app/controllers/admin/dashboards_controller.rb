class Admin::DashboardsController < Admin::BaseController
	def index
		
	end

	def numOfAlbums 
		return Album.all.count
	end
	def numOfSongs 
		return Song.all.count
	end
	def numOfUsers 
		return User.all.count
	end
	def numOfGenres 
		return Genre.all.count
	end

	def numOfArtists 
		return Artist.all.count
	end
	def numOfPlaylists 
		return Playlist.all.count
	end
	helper_method :numOfAlbums, :numOfSongs, :numOfUsers, :numOfGenres, :numOfArtists, :numOfPlaylists
	
	def show
	end
end
