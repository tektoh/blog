class ArticlesController < ApplicationController
  skip_before_action :require_login

  before_action -> { expires_in 1.hour }

  caches_action :index, :show, expires_in: 1.hour

  def index; end

  def show; end

  private

  Taxonomy::taxonomy_types.map(&:underscore).each do |taxonomy|
    method_name = :"#{taxonomy}?"
    define_method(method_name) { params[:"#{taxonomy}_slug"].present? }
    helper_method method_name
  end

  def taxonomy_name
    return @taxonomy_name if defined?(@taxonomy_name)
    @taxonomy_name = Taxonomy::taxonomy_types
                       .map(&:underscore)
                       .find { |taxonomy_type| send(:"#{taxonomy_type}?") }
  end

  def taxonomy?
    taxonomy_name.present?
  end
  helper_method :taxonomy?

  def taxonomy
    @taxonomy ||= taxonomy_name.classify.constantize.find_by!(slug: params[:"#{taxonomy_name}_slug"])
  end
  helper_method :taxonomy

  def title
    @title ||= taxonomy? ? taxonomy.name : ''
  end
  helper_method :title

  def article
    @article ||= category.articles.viewable.find_by!(slug: params[:article_slug]).decorate
  end
  helper_method :article

  def category
    @category ||= Category.find_by!(slug: params[:category_slug])
  end
  helper_method :category

  def articles
    return @articles if defined? @articles
    @articles = taxonomy? ? taxonomy.articles : Article.all
    @articles = @articles.archives_in(params[:year], params[:month]) if params[:year]
    @articles.new_arrivals.page(params[:page]).per(5)
  end
  helper_method :articles
end
