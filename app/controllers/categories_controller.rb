class CategoriesController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_category, only: [:show, :update, :destroy]

  def index
    json_response(Category.all)
  end

  def show
    json_response(@category)
  end

  def create
    @category = Item.new(categories_params)
    if @category.save
      json_response(@category, :created)
    else
      json_response({ message: @category.errors.full_messages }, 422)
    end
  end

  def update
    @category.name = params[:name]
    if @category.save
      head :no_content
    else
      json_response({ message: @category.errors.full_messages }, 422)
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def categories_params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
