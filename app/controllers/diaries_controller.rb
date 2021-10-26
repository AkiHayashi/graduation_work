class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: %i[show edit update destroy]
  before_action :current_user_restriction_diary, only: %i[show edit update destroy]

  # GET /diaries
  def index
    @diaries = current_user.diaries.order(created_at: "ASC")
    if current_user.families.exists?
      @families = current_user.families
      @families.each {|family| @members = family.members}
      @family_members_ids = @members.map {|member| member.user_id }
      @diaries = Diary.where(user_id: @family_members_ids ).order(created_at: "ASC")
    end
  end

  # GET /diaries/1
  def show
  end

  # GET /diaries/new
  def new
    @diary = current_user.diaries.build
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  def create
    @diary = current_user.diaries.build(diary_params)

    if @diary.save
      redirect_to @diary, notice: '日記を作成しました'
    else
      render :new
    end
  end

  # PATCH/PUT /diaries/1
  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: '日記の内容を更新しました'
    else
      render :edit
    end
  end

  # DELETE /diaries/1
  def destroy
    @diary.destroy
    redirect_to diaries_url, notice: '日記を削除しました'
  end

  def menu
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    def current_user_restriction_diary
      if current_user.id != @diary.user.id 
        redirect_to diaries_path, alert: 'アクセス権限がありません'
      end
    end
    # Only allow a trusted parameter "white list" through.
    def diary_params
      params.require(:diary).permit(:title, :content, :image, :image_cache)
    end
end
