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

  TAXONOMY_MODELS = [Category, Tag, Author]

  class << self
    def taxonomy_types
      TAXONOMY_MODELS.map(&:name)
    end
  end

  TAXONOMY_MODELS.each do |model|
    define_method(:"#{model.model_name.singular}?") { is_a?(model) }
  end
end
