class CoinsLogsController < ApplicationController
  before_action :set_coins_log, only: [:show, :edit, :update, :destroy]

  # GET /coins_logs
  # GET /coins_logs.json
  def index

    @headers = %w(财说用户ID 产品ID 姓名 投资金额 状态)
    @coins_logs = CoinsLog.all
      #binding.pry

    @status_kinds = @coins_logs.select(:status).group(:status).map(&:status)

    @q = CoinsLog.search(params[:q])
    @coins_log = @q.result
    #判断页面数据是html还是格式csv
    respond_to do |format|
      format.html {
        @coins_log = @coins_log.paginate(page: params[:page] || 1, per_page: 15)
      }
      format.csv {
        result = @coins_log.pluck(:caishuo_id, :coins_id, :name, :amount, :status).map { |d| Hash[@headers.zip(d)] }
        render_csv(result, filename: "xxx.csv", headers: Hash[@headers.zip(@headers)])
      }
    end

  end

  # GET /coins_logs/1
  # GET /coins_logs/1.json
  def show
  end

  # GET /coins_logs/new
  def new
    @coins_log = CoinsLog.new
  end

  # GET /coins_logs/1/edit
  def edit
  end

  # POST /coins_logs
  # POST /coins_logs.json
  def create
    @coins_log = CoinsLog.new(coins_log_params)

    respond_to do |format|
      if @coins_log.save
        format.html { redirect_to @coins_log, notice: 'Coins log was successfully created.' }
        format.json { render :show, status: :created, location: @coins_log }
      else
        format.html { render :new }
        format.json { render json: @coins_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins_logs/1
  # PATCH/PUT /coins_logs/1.json
  def update
    respond_to do |format|
      if @coins_log.update(coins_log_params)
        format.html { redirect_to @coins_log, notice: 'Coins log was successfully updated.' }
        format.json { render :show, status: :ok, location: @coins_log }
      else
        format.html { render :edit }
        format.json { render json: @coins_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins_logs/1
  # DELETE /coins_logs/1.json
  def destroy
    @coins_log.destroy
    respond_to do |format|
      format.html { redirect_to coins_logs_url, notice: 'Coins log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coins_log
      @coins_log = CoinsLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coins_log_params
      params.require(:coins_log).permit(:name, :amount)
    end
end
