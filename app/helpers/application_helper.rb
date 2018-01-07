module ApplicationHelper
  def default_meta_tags
    {
      site: current_site.name,
      reverse: true,
      title: nil,
      description: current_site.description,
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: current_site.og_image_url(:ogp),
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end

  def article_meta_tags(article)
    {
      site: current_site.name,
      reverse: true,
      title: article.title,
      description: current_site.description,
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: article.eye_cache.attached? ? article.eye_cache_url(:ogp) : current_site.og_image_url(:ogp),
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end

  def flash_class(key)
    { alert: 'danger', notice: 'success' }.fetch(key.to_sym) { 'danger' }
  end
end
