class MedicalHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medical_history, only: %i[show edit update destroy]
  before_action :current_user_restriction_medical, only: %i[show edit update destroy]

  def index
    @medical_histories = current_user.medical_histories
  end

  def show
  end

  def new
    @medical_history = current_user.medical_histories.build
    @hospital = @medical_history.hospitals.build
  end

  def edit
    @hospital = @medical_history.hospitals.build
  end

  def create
    @medical_history = current_user.medical_histories.new(medical_history_params)
    if @medical_history.save
      redirect_to @medical_history, notice: '既往歴が作成されました。'
    else
      @medical_history.hospitals.destroy_all
      @medical_history.hospitals.build
      render :new
    end
  end

  def update
    if @medical_history.update(medical_history_params)
      redirect_to @medical_history, notice: '既往歴が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @medical_history.destroy!
    redirect_to medical_histories_url, notice: '既往歴が削除されました。'
  end

  private
  def set_medical_history
    @medical_history = MedicalHistory.find(params[:id])
  end

  def current_user_restriction_medical
    if current_user.id != @medical_history.user.id 
      redirect_to medical_histories_path, alert: 'アクセス権限がありません'
    end
  end

  def medical_history_params
    params.require(:medical_history).permit(:name, :start_on, :surgery, :surgery_on, :user_id,
    hospitals_attributes: %i[id name address tel _destroy])#.merge(user_id: current_user.id)
  end
end
