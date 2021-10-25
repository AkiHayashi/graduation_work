class FavoritesController < ApplicationController

  def index
    @diaries = current_user.favorite_diaries
  end

  def create
    @diary = Diary.find(params[:id])
    favorite = current_user.favorites.new(diary_id: @diary.id)
    favorite.save
  end

  def destroy
    @diary = Diary.find(params[:id])
    favorite = current_user.favorites.find_by(diary_id: @diary.id)
    favorite.destroy
  end
end
