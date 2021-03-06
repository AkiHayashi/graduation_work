class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: %i[show edit update destroy]
  before_action :current_user_restriction_diary, only: %i[edit update destroy]

  def index
    @diaries = current_user.diaries.order(created_at: "DESC")
    if current_user.families.exists?
      @families = current_user.families
      @members = []
      @families.each {|family| @members << family.members}
      @family_members_ids = @members.flatten.map(&:user_id)
      @diaries = Diary.where(user_id: @family_members_ids ).order(created_at: "DESC")
    end
  end

  def show
  end

  def new
    @diary = current_user.diaries.build
  end

  def edit
  end

  def create
    @diary = current_user.diaries.build(diary_params)

    if @diary.save
      redirect_to @diary, notice: '日記を作成しました'
    else
      render :new
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: '日記の内容を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy!
    redirect_to diaries_path, notice: '日記を削除しました'
  end

  def menu
  end

  private
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
