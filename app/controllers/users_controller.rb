class UsersController < ApplicationController
  def show
  @user = User.find_by(id: params[:id])
  end

  def new
  @user = User.new
  end

  def create
    @user = User.new(user_parmas)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_parmas
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
