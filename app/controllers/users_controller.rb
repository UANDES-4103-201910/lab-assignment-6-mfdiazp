class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:notice] = "User created successfully"
      redirect_to "/users/new"
    else
      error_message = ""
      new_user.errors.full_messages.each do |message|
        error_message += message + ". "
      end
      flash[:notice] = "User creation failed: " + error_message
      redirect_to "/users/new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to "/users/" + @user.id.to_s
    else
      flash[:notice] = "User update failed"
      redirect_to "/users/" + @user.id.to_s
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
