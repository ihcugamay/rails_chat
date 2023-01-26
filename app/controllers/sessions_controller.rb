# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  before_action :login_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

  def login_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_path
  end
end
