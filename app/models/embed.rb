# frozen_string_literal: true

# == Schema Information
#
# Table name: embeds
#
#  id         :bigint(8)        not null, primary key
#  embed_type :integer          default(NULL), not null
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Embed < ApplicationRecord
  include ArticleBlockable

  has_one :article_block, as: :blockable, dependent: :destroy
  has_one :article, through: :article_block

  enum embed_type: {
    html: 1,
    youtube: 2
  }

  validates :identifier, length: { maximum: 200 }, unless: :html?
  validates :body, length: { maximum: 10_000 }, if: :html?

  def empty?
    !html? && identifier.blank? || html? && body.blank?
  end
end
