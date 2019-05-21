# frozen_string_literal: true

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
        type: "website",
        url: request.original_url,
        image: current_site&.og_image_url,
        site_name: :site,
        description: :description,
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image"
      }
    }
  end

  def flash_class(key)
    { alert: "danger", notice: "success" }.fetch(key.to_sym) { "danger" }
  end

  def cover_image_url
    current_site&.cover_image&.url
  end
end
