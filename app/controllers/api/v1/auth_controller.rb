class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]
  skip_before_action :authorized, only: [:create]
  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      #YOU ARE WHO YOU SAY YOU ARE
      token = encode_token({ user_id: @user.id})
      render json: { jwt: token, user_id: @user.id}
    else

      render json: { error: "could not log in"}, status: 422
    end
  end
end
