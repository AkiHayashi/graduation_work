class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family, only: %i[show edit update destroy]
  before_action :current_user_restriction_family, only: %i[show edit update destroy]


  # GET /families
  def index
    @families = current_user.families
  end

  # GET /families/1
  def show
  end

  # GET /families/new
  def new
    @family = current_user.families.build
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  def create
    @family = current_user.families.build(family_params)

    if @family.save
      @family.invite_member(current_user)
      redirect_to @family, notice: '新しい家族を追加しました'
    else
      render :new
    end
  end

  # PATCH/PUT /families/1
  def update
    if @family.update(family_params)
      redirect_to @family, notice: '家族の情報を更新しました'
    else
      render :edit
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy
    redirect_to families_url, notice: '家族を削除しました'
  end

  def menu
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    def current_user_restriction_family
      unless  @family.users.ids.include?(current_user.id)
        redirect_to families_path, alert: 'アクセス権限がありません'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def family_params
      params.require(:family).permit(:name, :image, :image_cache)
    end
end
