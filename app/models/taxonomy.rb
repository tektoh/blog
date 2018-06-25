# == Schema Information
#
# Table name: taxonomies
#
#  id          :bigint(8)        not null, primary key
#  type        :string
#  name        :string
#  slug        :string
#  icon        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_taxonomies_on_slug  (slug)
#  index_taxonomies_on_type  (type)
#

class Taxonomy < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :type }, length: { maximum: 16 }
  validates :slug, presence: true, uniqueness: { scope: :type }, length: { maximum: 64 }, slug_format: true

  def category?
    is_a?(Category)
  end

  def tag?
    is_a?(Tag)
  end

  def author?
    is_a?(Author)
  end
end
