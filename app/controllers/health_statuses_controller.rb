class HealthStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_health_status, only: [:show, :edit, :update, :destroy]

  # GET /health_statuses
  def index
    @health_statuses = current_user.health_statuses
  end

  # GET /health_statuses/1
  def show
  end

  # GET /health_statuses/new
  def new
    @health_status = current_user.health_statuses.build
  end

  # GET /health_statuses/1/edit
  def edit
  end

  # POST /health_statuses
  def create
    @health_status = current_user.health_statuses.build(health_status_params)

    if @health_status.save
      binding.irb
      redirect_to @health_status, notice: 'Health status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /health_statuses/1
  def update
    if @health_status.update(health_status_params)
      redirect_to @health_status, notice: 'Health status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /health_statuses/1
  def destroy
    @health_status.destroy
    redirect_to health_statuses_url, notice: 'Health status was successfully destroyed.'
  end

  def menu
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_status
      @health_status = HealthStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def health_status_params
      params.require(:health_status).permit(:systolic, :diastolic, :pulse, :condition)
    end
end
