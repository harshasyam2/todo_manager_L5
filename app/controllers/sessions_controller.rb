class SessionsController < ApplicationController
  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to "/"
    else
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user_id = nil
    redirect_to "/"
  end
end
