class UserLogsController < ApplicationController
  before_action :set_user_log, only: [:show, :edit, :update, :destroy]

  # GET /user_logs
  # GET /user_logs.json
  def index

    # 写法1
    # if params[:caishuo_id].blank?
    #   @user_logs = UserLog.all
    # else
    #   @user_logs = UserLog.where(caishuo_id: params[:caishuo_id]).to_a
    # end

    # 写法2
    # binding.pry
    @q = UserLog.search(params[:q])
    @user_logs = @q.result

    # @user_logs = @user_logs.where(caishuo_id: params[:caishuo_id]) if params[:caishuo_id].present?

    # @user_logs = @user_logs.where(coin_id: params[:coin_id]) if params[:coin_id].present?
    #@questions = UserLog.paginate(page:params[:page],per_page:2) 
    @user_logs = @user_logs.paginate(page: params[:page] || 1, per_page:2) 
# binding.pry
# puts "s"
  end

  # GET /user_logs/1
  # GET /user_logs/1.json
  def show
  end

  # GET /user_logs/new
  def new
    @user_log = UserLog.new
  end

  # GET /user_logs/1/edit
  def edit
  end

  # POST /user_logs
  # POST /user_logs.json
  def create
    @user_log = UserLog.new(user_log_params)

    respond_to do |format|
      if @user_log.save
        format.html { redirect_to @user_log, notice: 'User log was successfully created.' }
        format.json { render :show, status: :created, location: @user_log }
      else
        format.html { render :new }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_logs/1
  # PATCH/PUT /user_logs/1.json
  def update
    respond_to do |format|
      if @user_log.update(user_log_params)
        format.html { redirect_to @user_log, notice: 'User log was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_log }
      else
        format.html { render :edit }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_logs/1
  # DELETE /user_logs/1.json
  def destroy
    @user_log.destroy
    respond_to do |format|
      format.html { redirect_to user_logs_url, notice: 'User log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_log
      @user_log = UserLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_log_params
      params.require(:user_log).permit(:caishuo_id, :coins_id, :name, :amount, :created_at, :status)
    end
end
