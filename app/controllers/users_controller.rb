class UsersController < ApplicationController

  CORRECT_EMAIL = /^[a-z0-9]+[@]{1}[a-z0-9]+$/.freeze

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if validate! && @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def validate!
    unique? && valid?
  end

  def unique?
    @check_user = User.find_by email: @user.email
    return false if @check_user else return true
  end

  def valid?
    return false if @user.email !~ CORRECT_EMAIL else return true
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
