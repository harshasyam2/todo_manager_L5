class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_display }.join("\n")
  end

  def new
    render "users/new"
  end

  def create
    new_user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    session[:current_user_id] = new_user.id
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists? ? "Login Successfull....True" : "Login Failed...False"
  end
end
