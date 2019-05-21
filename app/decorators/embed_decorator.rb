# frozen_string_literal: true

class EmbedDecorator < Draper::Decorator
  delegate_all

  def box_header_icon
    h.content_tag "i", nil, class: %w[fa fa-youtube-play]
  end

  def box_title
    "埋め込み"
  end
end
