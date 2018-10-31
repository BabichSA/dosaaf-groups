class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  # GET /instructors
  # GET /instructors.json
  def index
    authorize! :read, Instructor

    if params[:q].nil?
      @q_params = {}
    else
      @q_params = params[:q]
    end
    @q = Instructor.ransack(@q_params)
    @instructors = @q.result

    # @instructors = Instructor.all
  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
    authorize! :read, @instructor
  end

  # GET /instructors/new
  def new
    authorize! :create, Instructor
    @instructor = Instructor.new
  end

  # GET /instructors/1/edit
  def edit
    authorize! :edit, @instructor
  end

  # POST /instructors
  # POST /instructors.json
  def create
    authorize! :create, Instructor
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Инструктор создан' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1
  # PATCH/PUT /instructors/1.json
  def update
    authorize! :update, @instructor
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'Инструктор обновлен' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    authorize! :destroy, @instructor
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'Инструктор удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
      params.require(:instructor).permit(:full_name, :phone, :car, :car_number)
    end
end
