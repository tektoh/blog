# == Schema Information
#
# Table name: sites
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  subtitle    :string
#  og_image    :string
#  favicon     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cover_image :string
#

FactoryBot.define do
  factory :site do
    
  end
end
