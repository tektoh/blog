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

require 'rails_helper'

RSpec.describe Medium, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
