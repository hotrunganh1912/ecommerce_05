class UsersController < ApplicationController
  before_action :load_user, only: %i(update show)
  def index
    @search = User.ransack params[:q]
    @users = @search.result
  end

  def show
    @users = User.find_by(id: params[:id])
  end

  def update
    @users.update_attributes(user_parmas)
    @users.save
    flash[:success] = "update ok"
  end

  private

  def load_user
    @users = User.find_by(id: params[:id])
  end

  def user_parmas
    params.require(:user).permit(:name, :address, :phone, :sex)
  end
end
