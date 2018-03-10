# == Schema Information
#
# Table name: taxonomies
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  name        :string(255)
#  slug        :string(255)
#  icon        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_taxonomies_on_slug  (slug)
#  index_taxonomies_on_type  (type)
#

class Author < Taxonomy
  mount_uploader :icon, AvatarUploader

  has_many :articles

  alias_attribute :avatar, :icon

  validates :avatar,
            file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: %w[image/jpeg image/png] }
end
