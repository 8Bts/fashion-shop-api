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
    @category = Category.create!(categories_params)
    json_response(@category, :created)
  end

  def update
    @category.update(categories_params)
    head :no_content
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
