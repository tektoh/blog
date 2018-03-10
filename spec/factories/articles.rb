# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  author_id    :integer
#  uuid         :string(255)
#  slug         :string(255)
#  eye_cache    :string(255)
#  title        :string(255)
#  description  :text(65535)
#  body         :text(65535)
#  state        :integer          default("draft"), not null
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#
# Indexes
#
#  index_articles_on_author_id     (author_id)
#  index_articles_on_category_id   (category_id)
#  index_articles_on_deleted_at    (deleted_at)
#  index_articles_on_published_at  (published_at)
#  index_articles_on_slug          (slug)
#  index_articles_on_uuid          (uuid)
#

FactoryBot.define do
  factory :article do
    
  end
end
