class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
    if user
      session[:name]=user_params[:username]
      redirect_to :stockcontroller_one_new
    else
      flash.now[:login_error]="11111"
      render "new"
    end
  end

  private
  def user_params
    params.require(:session).permit(:username, :password)
  end
end
