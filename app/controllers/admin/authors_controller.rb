class Admin::AuthorsController < ApplicationController
  layout 'admin'

  before_action :set_author, only: %i[edit update destroy]

  def index
    authorize(:taxonomy)

    @authors = Author.all.order(:slug)
    @author = Author.new
  end

  def create
    authorize(:taxonomy)

    @author = Author.new(author_params)

    if @author.save
      redirect_to admin_authors_path
    else
      @authors = Author.all.order(:slug)
      render :index
    end
  end

  def edit
    authorize(:taxonomy)
  end

  def update
    authorize(:taxonomy)

    if @author.update(author_params)
      redirect_to admin_authors_path
    else
      render :edit
    end
  end

  def destroy
    authorize(:taxonomy)

    @author.destroy

    redirect_to admin_authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :slug, :description, :avatar)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
