# frozen_string_literal: true

class Admin::Articles::PreviewsController < AdminController
  include ArticleBuilder

  skip_before_action :require_login

  before_action :preview!

  layout "application"

  def show; end

  private

    def article
      return @article if defined?(@article)
      @article = Article.find_by!(uuid: params[:article_uuid]).decorate
      @article.body = build_article_body(@article)
      @article
    end
    helper_method :article
end
