# frozen_string_literal: true

class SiteDecorator < Draper::Decorator
  delegate_all

  def og_image_url
    object.og_image&.url
  end
end
