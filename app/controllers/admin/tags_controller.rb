class Admin::TagsController < ApplicationController
  layout 'admin'

  before_action :set_tag, only: %i[edit update destroy]

  def index
    authorize(:taxonomy)

    @tags = Tag.all.order(:slug)
    @tag = Tag.new
  end

  def create
    authorize(:taxonomy)

    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to admin_tags_path
    else
      @tags = Tag.all.order(:slug)
      render :index
    end
  end

  def edit
    authorize(:taxonomy)
  end

  def update
    authorize(:taxonomy)

    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
    authorize(:taxonomy)

    @tag.destroy

    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :slug)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
