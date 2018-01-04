class Admin::CategoriesController < ApplicationController
  layout 'admin'

  before_action :set_category, only: %i[edit update destroy]

  def index
    authorize(:taxonomy)

    @categories = Category.all.order(:slug)
    @category = Category.new
  end

  def create
    authorize(:taxonomy)

    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all.order(:slug)
      render :index
    end
  end

  def edit
    authorize(:taxonomy)
  end

  def update
    authorize(:taxonomy)

    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    authorize(:taxonomy)

    @category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
