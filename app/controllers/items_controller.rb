class ItemsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_item, only: [:show, :update, :destroy]

  def index
    json_response(Item.all)
  end

  def show
    json_response(@item)
  end

  def create
    @item = Item.new(items_params)
    @item.categories << Category.find_by(name: params[:category])
    if @item.save
      json_response(@item, :created)
    else
      json_response({ message: @item.errors.full_messages }, 422)
    end
  end

  def update
    @item.title = params[:title]
    @item.price = params[:price]

    if @item.img_public_id != params[:img_public_id]
      Cloudinary::Api.delete_resources([params[:img_public_id]])
      @item.img_public_id = params[:img_public_id]
      @item.image = params[:image]
    end
    

    unless @item.categories.include?(params[:category])
      @item.categories.delete(@item.categories.first)
      @item.categories << Category.find_by(name: params[:category])
    end
    
    if @item.save
      head :no_content
    else
      json_response({ message: @item.errors.full_messages }, 422)
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def items_params
    params.permit(:title, :price, :image, :img_public_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
