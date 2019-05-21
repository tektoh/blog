# frozen_string_literal: true

class SentenceDecorator < Draper::Decorator
  delegate_all

  def box_header_icon
    h.content_tag "i", nil, class: %w[fa fa-edit]
  end

  def box_title
    "文章"
  end
end
