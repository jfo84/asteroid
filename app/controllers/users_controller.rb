class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def create
    @user = User.create!(user_params)
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  private

  def user_params
    params.require(:user) # TODO: Slice only needed params
  end
end
