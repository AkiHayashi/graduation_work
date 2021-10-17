class FavoritesController < ApplicationController
  def create
    @diary = Diary.find(params[:diary])
    current_user.favorite(@diary)
  end

  def destroy
    @diary = Favorite.find(params[:id]).diary
    current_user.unfavorite(@diary)
  end
end
