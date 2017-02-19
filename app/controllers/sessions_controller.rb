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

  def create_oauth

  if @user = User.find_by_username(request.env['omniauth.auth']['info']['nickname'])
    login(@user)
    redirect_to root_path
  else
    password = Faker::Internet.password(18)
    @user = User.create(email: request.env['omniauth.auth']['info']['email'], username: request.env['omniauth.auth']['info']['nickname'], password: password, password_confirmation: password, image_url: request.env['omniauth.auth']['info']['image'])
    login(@user)
    redirect_to edit_user_path(@user)
  end
end

  def destroy
    log_out
    redirect_to root_path
  end
end
