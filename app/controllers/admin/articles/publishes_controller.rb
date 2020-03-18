# frozen_string_literal: true

class Admin::Articles::PublishesController < AdminController
  include ArticleBuilder

  layout "admin"

  def update
    article.published_at = Time.current unless article.published_at?
    article.state = :published

    if article.valid?
      Article.transaction do
        article.body = build_article_body(article)
        article.save!
      end

      clear_articles_cache

      flash[:notice] = "記事を公開しました"

      redirect_to edit_admin_article_path(article.uuid)
    else
      flash.now[:alert] = "エラーがあります。確認してください。"

      article.state = article.state_was if article.state_changed?
      render "admin/articles/edit"
    end
  end

  private
    def article
      return @article if defined?(@article)
      @article = Article.find_by!(uuid: params[:article_uuid]).decorate
      @article
    end
    helper_method :article

    def clear_articles_cache
      Rails.cache.delete_matched("views/*/index")
      Rails.cache.delete_matched("views/*/#{article.category_slug}")
      Rails.cache.delete_matched("views/*/#{article.category_slug}/*")
      Rails.cache.delete_matched("views/*/authors/#{article.author_slug}") if article.author.present?
      article.tags.each do |tag|
        Rails.cache.delete_matched("views/*/tags/#{tag.slug}")
      end
    end
end
