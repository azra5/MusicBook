class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      flash[:notice] = 'Logged in successfully!'
      cookies[:user_id] = @user.id
      if current_user.admin?
          redirect_to admin_root_path
        else
      redirect_to root_path 
    end
    else
      flash[:error] = 'Incorrect username or password!'
      render :new
    end
  end

  def destroy
    cookies.delete :user_id
    redirect_to new_session_path
  end
end
