module ApplicationHelper
  def default_meta_tags(site = nil)
    @site = site || current_site
    {
      site: @site.name,
      reverse: true,
      title: nil,
      description: @site.description,
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: @site.og_image.variant(resize: '1200x630'),
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
