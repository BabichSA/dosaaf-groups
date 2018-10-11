class DrivingsController < ApplicationController
  before_action :set_driving, only: [:show, :edit, :update, :destroy]

  # GET /drivings
  # GET /drivings.json
  def index
    authorize! :read, Driving
    
    if params[:q].nil?
      @q_params = {}
    else
      @q_params = params[:q]
    end
    @q = Driving.ransack(params[:q])
    @drivings = @q.result
  end

  def simple
    authorize! :read, Driving
    authorize! :create, Driving
  end

  # GET /drivings/1
  # GET /drivings/1.json
  def show
    authorize! :read, @driving
  end

  # GET /drivings/new
  def new
    authorize! :create, Driving
    @driving = Driving.new
  end

  # GET /drivings/1/edit
  def edit
    authorize! :edit, @driving
  end

  # POST /drivings
  # POST /drivings.json
  def create
    authorize! :create, Driving
    @driving = Driving.new(driving_params)

    respond_to do |format|
      if @driving.save
        format.html { redirect_to @driving, notice: 'Вождение назначено' }
        format.json { render :show, status: :created, location: @driving }
      else
        format.html { render :new }
        format.json { render json: @driving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivings/1
  # PATCH/PUT /drivings/1.json
  def update
    authorize! :update, @driving
    respond_to do |format|
      if @driving.update(driving_params)
        format.html { redirect_to @driving, notice: 'Вождение обновлено' }
        format.json { render :show, status: :ok, location: @driving }
      else
        format.html { render :edit }
        format.json { render json: @driving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivings/1
  # DELETE /drivings/1.json
  def destroy
    authorize! :destroy, @driving
    
    @driving.destroy
    respond_to do |format|
      format.html { redirect_to drivings_url, notice: 'Вожднеие отменено' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driving
      @driving = Driving.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driving_params
      params.require(:driving).permit(:instructor_id, :student_id, :start_date)
    end
end
