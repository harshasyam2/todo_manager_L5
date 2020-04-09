class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_display }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    render plain: new_user.to_display
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists? ? "Login Successfull....True" : "Login Failed...False"
  end
end
