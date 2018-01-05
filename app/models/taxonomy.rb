# == Schema Information
#
# Table name: taxonomies
#
#  id         :bigint(8)        not null, primary key
#  type       :string(255)
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taxonomies_on_slug  (slug)
#  index_taxonomies_on_type  (type)
#

class Taxonomy < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :type }, length: { maximum: 16 }
  validates :slug, presence: true, uniqueness: { scope: :type }, length: { maximum: 16 }, slug_format: true
end
