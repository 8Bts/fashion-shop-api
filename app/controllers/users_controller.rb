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

  def find
    @user = User.find_by(name: params[:name])
    if @user
      json_response(@user)
    else
      json_response({ message: 'User not found'}, :not_found)
    end  
  end

  private

  def user_params
    params.permit(:name, :admin_level)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
