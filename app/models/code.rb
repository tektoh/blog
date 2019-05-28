# frozen_string_literal: true

# == Schema Information
#
# Table name: codes
#
#  id         :bigint(8)        not null, primary key
#  mode       :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Code < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ArticleBlockable

  belongs_to_active_hash :code_mode, foreign_key: :mode

  has_one :article_block, as: :blockable, inverse_of: :blockable, dependent: :destroy
  has_one :article, through: :article_block

  before_create -> { self.mode = "plain_text" if mode.blank? }

  def empty?
    body.blank?
  end
end
