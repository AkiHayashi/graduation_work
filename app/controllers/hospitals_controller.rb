class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  # GET /hospitals
  def index
    @medical_histories = current_user.medical_histories
    @hospitals = []
    @medical_histories.each { |history| @hospitals << history.hospitals }
    @hospitals.flatten!
  end

  # GET /hospitals/1
  def show 
  end

  # GET /hospitals/new
  def new
    @hospital = current_user.hospitals.build(hospital_params)
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals
  def create
    @hospital = current_user.hospitals.build(hospital_params)

    if @hospital.save
      redirect_to @hospital, notice: 'Hospital was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hospitals/1
  def update
    if @hospital.update(hospital_params)
      redirect_to @hospital, notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hospitals/1
  def destroy
    @hospital.destroy
    redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hospital_params
      params.require(:hospital).permit(:name, :address, :tel, :user_id)
    end
end
