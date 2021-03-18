class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'A new category has been created'
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'There was an error, try again!'
      render 'new'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end




end
