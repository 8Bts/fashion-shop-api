class UsersController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_user, only: %i[show update add_favourite remove_favourite destroy]

  def index
    json_response(User.all)
  end

  def show
    json_response(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user, :created)
    else
      json_response({ message: @user.errors.full_messages }, 422)
    end
  end

  def update
    @user.name = params[:name]
    if @user.save
      head :no_content
    else
      json_response({ message: @user.errors.full_messages }, 422)
    end
  end

  def add_favourite
    item = Item.find(params[:item_id])
    @user.favourites << item if item
  end

  def remove_favourite
    item = Item.find(params[:item_id])
    @user.favourites.delete(item) if item
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
      json_response({ message: 'User not found' }, :not_found)
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
