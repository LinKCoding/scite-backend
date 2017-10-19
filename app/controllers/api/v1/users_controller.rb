class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name],  email: params[:email], password: params[:password])
    byebug
    if @user.save
      render json: { message: "#{@user.email} saved"}
    else
      render json: { message: "could not create account"}
      # check after creating validations
    end
  end

  def notes
    if @user
      render json: @user.notes
    end
  end

  def lexicons
    if @user
      render json: { lexicons: @user.lexicons}
    end
  end


end
