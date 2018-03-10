# == Schema Information
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  subtitle    :string(255)
#  og_image    :string(255)
#  favicon     :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Site, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
