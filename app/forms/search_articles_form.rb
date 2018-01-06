class SearchArticlesForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attribute :category_id, Integer
  attribute :title, String

  def category_id?
    category_id.present?
  end

  def title?
    title.present?
  end

  def title_words
    title? ? title.split(nil) : []
  end
end
