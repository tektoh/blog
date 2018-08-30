module ArticleBlockable
  extend ActiveSupport::Concern

  def empty?
    raise NoMethodError
  end
end
