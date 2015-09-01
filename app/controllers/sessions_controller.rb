class SessionsController < ApplicationController

  def new
  end

  def create
    user.find_by_credentials(
      params[:user][:handle],
      params[:user][:password]
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
    rediect_to new_session_url
  end

end
