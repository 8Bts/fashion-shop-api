class UsersController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    json_response(User.all)
  end

  def show
    json_response(@user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
