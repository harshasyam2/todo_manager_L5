class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      flash[:error] = "User with entered details exists.Please try again."
      redirect_to new_user_path
    else
      new_user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
      )
      if new_user.save
        session[:current_user_id] = new_user.id
        redirect_to "/"
      else
        flash[:error] = new_user.errors.full_messages.join(",")
        redirect_to new_user_path
      end
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists? ? "Login Successfull....True" : "Login Failed...False"
  end
end
