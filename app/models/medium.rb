# frozen_string_literal: true

# == Schema Information
#
# Table name: media
#
#  id         :bigint(8)        not null, primary key
#  media_type :integer          default("image"), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medium < ApplicationRecord
  include ArticleBlockable

  has_one :article_block, as: :blockable, inverse_of: :blockable, dependent: :destroy
  has_one :article, through: :article_block

  has_one :medium_image, dependent: :destroy
  has_one :image, through: :medium_image

  attribute :attachment
  attribute :attachment_url

  enum media_type: %i[image]

  validates :name, allow_blank: true, length: { maximum: 200 }
  validates :attachment, presence: { message: "ファイルを選択してください" }, allow_blank: true, unless: :attachment_url?
  validates :attachment_url, url: { schemes: %w[http https] }, allow_blank: true
  validate :validate_attachment_url, if: :attachment_url?

  before_save :create_image_by_attachment!, if: :will_create_image_by_attachment?
  before_save :create_image_by_attachment_url!, if: :will_create_image_by_attachment_url?

  def empty?
    image.blank?
  end

  def validate_attachment_url
    response = Faraday.head(attachment_url)
    if response.success?
      content_type = response.headers["content-type"]
      if content_type.present? && !MIME::Type.new(content_type).simplified.match(%r{\Aimage/(jpeg|png)\z})
        errors.add(:attachment_url, "URLが画像ではありません")
      end
    else
      errors.add(:attachment_url, "エラーが発生しました: #{response.headers['status']}")
    end
  end

  def will_create_image_by_attachment?
    image? && attachment.present?
  end

  def create_image_by_attachment!
    self.image = Image.create!(file: attachment)
  end

  def will_create_image_by_attachment_url?
    image? && !attachment.present? && attachment_url?
  end

  def create_image_by_attachment_url!
    self.image = Image.create!(remote_file_url: attachment_url)
  end
end
