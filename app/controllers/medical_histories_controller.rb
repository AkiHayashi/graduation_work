class MedicalHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medical_history, only: [:show, :edit, :update, :destroy]

  # GET /medical_histories
  def index
    @medical_histories = current_user.medical_histories
  end

  # GET /medical_histories/1
  def show
  end

  # GET /medical_histories/new
  def new
    @medical_history = current_user.medical_histories.build
    @hospital = @medical_history.hospitals.build
  end

  # GET /medical_histories/1/edit
  def edit
    @hospital = @medical_history.hospitals.build
  end

  # POST /medical_histories
  def create
    @medical_history = current_user.medical_histories.build(medical_history_params)
    @hospital = @medical_history.hospitals.build
    if @medical_history.save
      redirect_to @medical_history, notice: 'Medical history was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /medical_histories/1
  def update
    if @medical_history.update(medical_history_params)
      redirect_to @medical_history, notice: 'Medical history was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /medical_histories/1
  def destroy
    @medical_history.destroy
    redirect_to medical_histories_url, notice: 'Medical history was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_history
      @medical_history = MedicalHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medical_history_params
      params.require(:medical_history).permit(:name, :start_on, :surgery, :surgery_on, :user_id,
      hospitals_attributes: %i[id name address tel _destroy])#.merge(user_id: current_user.id)
    end
end
