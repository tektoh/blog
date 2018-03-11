# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sentence < ApplicationRecord
  has_one :article_block, as: :blockable, dependent: :destroy
  has_one :article, through: :article_block
end
