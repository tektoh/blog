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

require 'rails_helper'

RSpec.describe ArticleBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
