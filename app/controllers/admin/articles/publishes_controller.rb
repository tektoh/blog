class Admin::Articles::PublishesController < ApplicationController
  include ArticleBuilder

  layout 'admin'

  def update
    article.published_at = Time.current unless article.published_at?
    article.state = :published

    if article.valid?
      Article.transaction do
        article.body = build_article_body(article)
        article.save!
      end

      flash[:notice] = '記事を公開しました'

      redirect_to edit_admin_article_path(article.uuid)
    else
      flash.now[:alert] = 'エラーがあります。確認してください。'

      article.state = article.state_was if article.state_changed?
      render 'admin/articles/edit'
    end
  end

  private

  def article
    return @article if defined?(@article)
    @article = Article.find_by!(uuid: params[:article_uuid]).decorate
    @article
  end
  helper_method :article
end
