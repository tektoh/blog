# == Schema Information
#
# Table name: article_blocks
#
#  id             :bigint(8)        not null, primary key
#  article_id     :bigint(8)
#  blockable_type :string(255)
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
  belongs_to :blockable, polymorphic: true

  validates :blockable_id, presence: true
  validates :level, presence: true, uniqueness: { scope: :article_id }

  def sentence?
    blockable.is_a?(Sentence)
  end
end
