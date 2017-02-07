class SessionsController < ApplicationController
  def new
  end

  def create
    @user ||= User.find_by_username(params[:user][:username])
    if !!@user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to root_path
    else
      flash[:error] = "Invalid Username or Password"
      redirect_to signin_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
