class SessionsController < ApplicationController

  def create
    token = request.env["omniauth.auth"].credentials.token
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
