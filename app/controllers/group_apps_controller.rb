class GroupAppsController < ApplicationController
  before_action :set_group_app, only: [:show, :edit, :update, :destroy]

  # GET /group_apps
  # GET /group_apps.json
  def index
    @group_apps = GroupApp.all
    @group_apps_available = GroupApp.where(available: true)
  end

  # GET /group_apps/1
  # GET /group_apps/1.json
  def show
    @group_apps = GroupApp.all
    @group_apps_available = GroupApp.where(available: true)
  end

  # GET /group_apps/new
  def new
    @group_app = GroupApp.new
  end

  # GET /group_apps/1/edit
  def edit
  end

  # POST /group_apps
  # POST /group_apps.json
  def create
    @group_app = GroupApp.new(group_app_params)

    respond_to do |format|
      if @group_app.save
        format.html { redirect_to "/group_apps", notice: 'Приложение добавлено.' }
        format.json { render :show, status: :created, location: @group_app }
      else
        format.html { render :new }
        format.json { render json: @group_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_apps/1
  # PATCH/PUT /group_apps/1.json
  def update
    respond_to do |format|
      if @group_app.update(group_app_params)
        format.html { redirect_to "/group_apps", notice: 'Приложение обновлено.' }
        format.json { render :show, status: :ok, location: @group_app }
      else
        format.html { render :edit }
        format.json { render json: @group_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_apps/1
  # DELETE /group_apps/1.json
  def destroy
    @group_app.destroy
    respond_to do |format|
      format.html { redirect_to group_apps_url, notice: 'Приложение удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_app
      @group_app = GroupApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_app_params
      params.require(:group_app).permit(:name, :body, :available, :group_link, :fa_icon)
    end
end
