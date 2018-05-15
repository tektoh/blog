# == Schema Information
#
# Table name: images
#
#  id           :bigint(8)        not null, primary key
#  file         :string
#  content_type :string
#  file_size    :string
#  title        :string
#  width        :integer
#  height       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
