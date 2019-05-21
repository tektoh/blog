# frozen_string_literal: true

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

class Tag < Taxonomy
  has_many :article_tags
  has_many :articles, through: :article_tags
end
