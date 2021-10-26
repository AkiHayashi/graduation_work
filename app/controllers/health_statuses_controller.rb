class HealthStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_health_status, only: %i[show edit update destroy]
  before_action :current_user_restriction_hs, only: %i[show edit update destroy]

  # GET /health_statuses
  def index
    @health_statuses = current_user.health_statuses.order(created_at: "ASC" )
    @systolic = create_chart_data(current_user.health_statuses.pluck(:created_at,:systolic))
    @diastolic = create_chart_data(current_user.health_statuses.pluck(:created_at, :diastolic))
    @pulse = create_chart_data(current_user.health_statuses.pluck(:created_at, :pulse))
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
      redirect_to @health_status, notice: '健康状態を記録しました'
    else
      render :new
    end
  end

  # PATCH/PUT /health_statuses/1
  def update
    if @health_status.update(health_status_params)
      redirect_to @health_status, notice: '健康状態の内容を更新しました'
    else
      render :edit
    end
  end

  # DELETE /health_statuses/1
  def destroy
    @health_status.destroy
    redirect_to health_statuses_url, notice: '健康状態の記録を一件削除しました'
  end

  def menu
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_status
      @health_status = HealthStatus.find(params[:id])
    end

    def current_user_restriction_hs
      if current_user.id != @health_status.user.id 
        redirect_to health_statuses_path, alert: 'アクセス権限がありません'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def health_status_params
      params.require(:health_status).permit(:systolic, :diastolic, :pulse, :condition)
    end

    def create_chart_data(plucked)
      results = []
      plucked.sort {|a, b| a[0] <=> b[0]}.each { |sys| results.push(sys[0].strftime('%m/%d'), sys[1]) }
      results.each_slice(2).map {|arr| arr }
    end
end
