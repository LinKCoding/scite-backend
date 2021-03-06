class ApplicationController < ActionController::API
  include NewRelic::Agent::Instrumentation::ControllerInstrumentation
  before_action :authorized, except: [:welcome]

  def encode_token(payload)
    token = JWT.encode(payload, ENV.fetch("JWT_SECRET"))
  end

  def auth_header
    header = request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, ENV.fetch("JWT_SECRET"), true, {algorithm: ENV.fetch("ENCRYPT_ALGOR")})
      rescue JWT::DecodeError
        [{}]
      end
    else
    end
  end

  def current_user
    if decoded_token
      if user_id = decoded_token[0]["user_id"]
        @user = User.find(user_id)
      else
      end
    else
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to "/welcome" unless logged_in?
  end

  def welcome
    render json: {message: "Please log in"}
  end

end
