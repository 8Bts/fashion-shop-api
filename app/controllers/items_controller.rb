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
    @item = Item.create!(items_params)
    json_response(@item, :created)
  end

  def update
    @item.update(items_params)
    head :no_content
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def items_params
    params.permit(:title, :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
