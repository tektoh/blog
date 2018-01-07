class ArticlesController < ApplicationController
  def index; end

  def show
    @category = Category.find_by!(slug: params[:category_slug])
    @article = @category.articles.find_by!(slug: params[:article_slug])
  end
end
