# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  media_type :integer          default("image"), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medium < ApplicationRecord
  has_one :article_block, as: :blockable, inverse_of: :blockable, dependent: :destroy
  has_one :article, through: :article_block

  has_one :medium_image, dependent: :destroy
  has_one :image, through: :medium_image

  attribute :attachment

  before_save do
    self.image = Image.create!(file: attachment) if attachment.present? && image?
    self
  end

  enum media_type: %i[image]
end
