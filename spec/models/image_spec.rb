# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  file         :string(255)
#  content_type :string(255)
#  file_size    :string(255)
#  title        :string(255)
#  width        :integer
#  height       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
