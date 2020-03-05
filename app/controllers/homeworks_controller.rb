class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  # GET /homeworks
  # GET /homeworks.json
  def index
    authorize! :read, Homework

    if params[:q].nil?
      @q_params = {}
    else
      @q_params = params[:q]
    end
    @q = Homework.ransack(@q_params)
    @homeworks = @q.result
  end

  def simple
    authorize! :read, Homework

    if params[:q].nil?
      @q_params = {}
    else
      @q_params = params[:q]
    end
    @q = Homework.ransack(@q_params)
    if can? :manage, Homework
      @homeworks = @q.result
    else
      @homeworks = @q.result.where(available: true)
    end
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    authorize! :read, @homework
  end

  # GET /homeworks/new
  def new
    authorize! :create, Homework
    @homework = Homework.new
  end

  # GET /homeworks/1/edit
  def edit
    authorize! :edit, @homework
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    authorize! :create, Homework
    @homework = Homework.new(homework_params)

    respond_to do |format|
      if @homework.save
        format.html { redirect_to simple_homeworks_path, notice: 'Домашнее задание создано' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      authorize! :update, @homework
      if @homework.update(homework_params)
        format.html { redirect_to simple_homeworks_path, notice: 'Домашнее задание обновлено' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    authorize! :destroy, @homework
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Домашнее задание удалено' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:title, :body, :assigned_at, :available)
    end
end
