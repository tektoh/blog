# frozen_string_literal: true

class MediumDecorator < Draper::Decorator
  delegate_all

  def box_header_icon
    h.content_tag "i", nil,  class: %w[fa fa-image]
  end

  def box_title
    "メディア"
  end
end
