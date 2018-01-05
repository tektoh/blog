# == Schema Information
#
# Table name: sites
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Site < ApplicationRecord
  has_one_attached :og_image
  has_one_attached :favicon

  validates :name, presence: true, length: { maximum: 64 }
  validates :description, length: { maximum: 255 }
  validates :og_image, attachment: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524288000 }
  validates :favicon, attachment: { purge: true, content_type: %r{\Aimage/png\Z}, maximum: 524288000 }
end
