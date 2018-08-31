# == Schema Information
#
# Table name: article_blocks
#
#  id             :bigint(8)        not null, primary key
#  article_id     :bigint(8)
#  blockable_type :string
#  blockable_id   :bigint(8)
#  level          :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_article_blocks_on_article_id                       (article_id)
#  index_article_blocks_on_blockable_type_and_blockable_id  (blockable_type,blockable_id)
#  index_article_blocks_on_level                            (level)
#

class ArticleBlock < ApplicationRecord
  belongs_to :article
  belongs_to :blockable, polymorphic: true, dependent: :destroy

  with_options on: %i[create update] do
    validates :blockable_type, presence: true
    validates :blockable_id, presence: true
    validates :level, presence: true, uniqueness: { scope: :article_id }
  end

  with_options on: :insert do
    validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end

  BLOCKABLE_MODELS = %w[Sentence Medium Embed Code]

  class << self
    def blockable_types
      BLOCKABLE_MODELS
    end

    def valid_blockable_type?(type)
      blockable_types.include?(type.to_s.classify)
    end

    def blockable_class(type)
      unless valid_blockable_type?(type)
        raise "ブロックタイプが不正です (#{type})"
      end
      type.to_s.classify.constantize
    end
  end

  BLOCKABLE_MODELS.each do |model|
    define_method(:"#{model.underscore}?") { blockable.is_a?(model.constantize) }
  end

  def insert_and_save!
    article_blocks_behind.reorder(level: :desc).each(&:shift_level!)
    save!
  end

  def shift_level!
    self.level = level.next
    save!
  end

  def article_blocks_behind
    article.article_blocks.where('level >= ?', level)
  end

  def create_blockable!(type, attributes = {}, &block)
    self.blockable = ArticleBlock.blockable_class(type).create!(attributes, &block)
  end
end
