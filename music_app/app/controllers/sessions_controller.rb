class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )

    if user.nil?
      flash[:errors] = ["Invalid credentials."]
      render :new
    else
      login_user!(user)
      redirect_to root_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def new
    render :new
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
