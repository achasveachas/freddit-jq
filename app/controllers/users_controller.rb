class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user ||= User.find_by_id(params[:id])
    if !can_edit?
      flash[:error] = "You do not have permission to edit this user"
      redirect_to :back
    end
  end

  def update
    @user ||= User.find_by_id(params[:id])
    if can_edit?
      @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = "You do not have permission to edit this user"
      redirect_to :back
    end
  end

  def show
    @user ||= User.find_by_id(params[:id])
  end

  def destroy
    @user ||= User.find_by_id(params[:id])
    if current_user.admin && current_user != @user
      @user.destroy
      redirect_to users_path
    else
      flash[:error] = "You do not have permission to perform this action"
      redirect_to :back
    end
  end

  def admin
    @user ||= User.find_by_id(params[:id])
    if current_user.admin && current_user != @user
      @user.admin = !@user.admin
      @user.save
    else
      flash[:error] = "You do not have permission to perform this action"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image_url)
  end
end
