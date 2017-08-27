class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:destroy]

  def destroy
    @favourite.destroy
      redirect_to favourites_home_path, notice: 'Favourite was successfully destroyed.' 
  end

  private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end
end
