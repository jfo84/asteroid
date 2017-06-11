class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def create
    @user = User.create!(allowed_params)
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  private

  def allowed_params
    params.require(:user)
  end
end
