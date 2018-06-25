class ArticlesController < ApplicationController
  skip_before_action :require_login

  def index
    return if taxonomy?
    hide_new_arrivals!
    hide_pagination!
  end

  def show
    @category = Category.find_by!(slug: params[:category_slug])
    @article = @category.articles.find_by!(slug: params[:article_slug])
  end

  private

  def tag?
    params[:tag_slug].present?
  end
  helper_method :tag?

  def author?
    params[:author_slug].present?
  end
  helper_method :author?

  def category?
    params[:category_slug].present?
  end
  helper_method :category?

  def taxonomy?
    tag? || author? || category?
  end
  helper_method :taxonomy?

  def title
    @title ||= if taxonomy?
                 taxonomy.name
               end
  end
  helper_method :title

  def articles
    return @articles if defined? @articles

    @articles = if taxonomy?
                  taxonomy.articles
                else
                  Article.all
                end

    @articles.new_arrivals.page(params[:page]).per(20)
  end
  helper_method :articles

  def taxonomy
    @taxonomy ||= if tag?
                    Tag.find_by!(slug: params[:tag_slug])
                  elsif author?
                    Author.find_by!(slug: params[:author_slug])
                  elsif category?
                    Category.find_by!(slug: params[:category_slug])
                  end
  end
  helper_method :taxonomy
end
