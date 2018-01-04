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
end
