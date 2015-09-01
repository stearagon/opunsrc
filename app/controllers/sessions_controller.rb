class SessionsController < ApplicationController
  skip_before_action :require_signed_in, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    user = User.find_by_credentials(
      params[:session][:handle],
      params[:session][:password]
      )

    if user
      sign_in(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username and/or password"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

end
