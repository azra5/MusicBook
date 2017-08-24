class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  def index
    @favourites = Favourite.all
  end

  def show
  end

  def new
    @favourite = Favourite.new
  end

  def edit
  end

  def create
    @favourite = Favourite.new(favourite_params)

      if @favourite.save
        redirect_to @favourite, notice: 'Favourite was successfully created.' 
      else
        render :new 
      end
  end

  def update
      if @favourite.update(favourite_params)
        redirect_to @favourite, notice: 'Favourite was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @favourite.destroy
      redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' 
  end

  private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    def favourite_params
      params.require(:favourite).permit(:user_id, :song_id)
    end
end
