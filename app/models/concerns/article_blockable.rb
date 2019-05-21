# frozen_string_literal: true

module ArticleBlockable
  extend ActiveSupport::Concern

  def empty?
    raise NoMethodError
  end
end
