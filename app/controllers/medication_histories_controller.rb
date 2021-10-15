class MedicationHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medication_history, only: [:show, :edit, :update, :destroy]

  # GET /medication_histories
  def index
    @medication_histories = current_user.medication_histories
  end

  # GET /medication_histories/1
  def show
  end

  # GET /medication_histories/new
  def new
    @medication_history = current_user.medication_histories.build
    @pharmacy = @medication_history.pharmacies.build
  end

  # GET /medication_histories/1/edit
  def edit
    @pharmacy = @medication_history.pharmacies.build
  end

  # POST /medication_histories
  def create
    @medication_history = current_user.medication_histories.build(medication_history_params)
    binding.irb
    if @medication_history.save!
      redirect_to @medication_history, notice: 'Medication history was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /medication_histories/1
  def update
    if @medication_history.update(medication_history_params)
      redirect_to @medication_history, notice: 'Medication history was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /medication_histories/1
  def destroy
    @medication_history.destroy
    redirect_to medication_histories_url, notice: 'Medication history was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication_history
      @medication_history = MedicationHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medication_history_params
      params.require(:medication_history).permit(
        :name, 
        :usage, 
        :prescription_on, 
        :note, 
        :user_id,
        pharmacies_attributes: %i{ 
          name 
          address
          tel 
          id
          _destroy}
        )
    end
end
