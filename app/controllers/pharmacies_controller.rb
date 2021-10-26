class PharmaciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pharmacy, only: %i[show edit update destroy]
  before_action :current_user_restriction_pharmacy, only: %i[show edit update destroy]
  # GET /pharmacies
  def index
    @medication_histories = current_user.medication_histories
    @pharmacies = []
    @medication_histories.each { |history| @pharmacies << history.pharmacies }
    @pharmacies.flatten!
  end

  # GET /pharmacies/1
  def show
  end

  # GET /pharmacies/new
  def new
    @pharmacy = current_user.pharmacies.build
  end

  # GET /pharmacies/1/edit
  def edit
  end

  # POST /pharmacies
  def create
    @pharmacy = current_user.pharmacies.build(pharmacy_params)

    if @pharmacy.save
      redirect_to @pharmacy, notice: '薬局を登録しました'
    else
      render :new
    end
  end

  # PATCH/PUT /pharmacies/1
  def update
    if @pharmacy.update(pharmacy_params)
      redirect_to @pharmacy, notice: '薬局の情報を更新しました'
    else
      render :edit
    end
  end

  # DELETE /pharmacies/1
  def destroy
    @pharmacy.destroy
    redirect_to pharmacies_url, notice: '薬局を一件削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacy
      @pharmacy = Pharmacy.find(params[:id])
    end

    def current_user_restriction_pharmacy
      if current_user.id != @pharmacy.medication_history.user.id 
        redirect_to pharmacies_path, alert: 'アクセス権限がありません'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def pharmacy_params
      params.require(:pharmacy).permit(:name, :address, :tel, :medication_histories_id)
    end
end
