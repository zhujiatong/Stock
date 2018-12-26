class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      render "new"
    else
      @user.save!
      flash.now[:register_success] = "invalid username or password"
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,:email)
  end
end
