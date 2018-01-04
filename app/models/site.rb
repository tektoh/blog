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
end
