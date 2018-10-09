class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change_password, :update_password]
  # authorize_resource class: false

  # GET /users
  # GET /users.json
  def index
    authorize! :read, User
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize! :read, @user
  end

  # GET /users/new
  def new
    authorize! :create, User
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @user
  end

  def change_password
    authorize! :change_password, @user
  end

  # POST /users
  # POST /users.json
  def create_manual
    authorize! :create, User
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, 'Пользователь создан' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Пользователь обновлен' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Пароль изменен' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :change_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize! :destroy, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :email,
        :username,
        :password,
        :password_confirmation,
        :role)
    end
end
