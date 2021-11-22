class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family, only: %i[show edit update destroy]
  before_action :current_user_restriction_family, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @family = current_user.families.build
  end

  def edit
  end

  def create
    @family = current_user.families.build(family_params)

    if @family.save
      @family.invite_member(current_user)
      redirect_to @family, notice: '新しい家族を追加しました'
    else
      render :new
    end
  end

  def update
    if @family.update(family_params)
      redirect_to @family, notice: '家族の情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @family.destroy!
    redirect_to families_url, notice: '家族を削除しました'
  end

  def menu
  end

  private
  def set_family
    @family = Family.find(params[:id])
  end

  def current_user_restriction_family
    unless  @family.users.ids.include?(current_user.id)
      redirect_to families_path, alert: 'アクセス権限がありません'
    end
  end

  def family_params
    params.require(:family).permit(:name, :image, :image_cache)
  end
end
