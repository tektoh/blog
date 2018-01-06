# == Schema Information
#
# Table name: sentences
#
#  id         :bigint(8)        not null, primary key
#  headline   :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :sentence do
    
  end
end
