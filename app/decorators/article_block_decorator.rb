class ArticleBlockDecorator < Draper::Decorator
  delegate_all

  decorates_association :blockable

  delegate :box_header_icon, to: :blockable
  delegate :box_title, to: :blockable
end
