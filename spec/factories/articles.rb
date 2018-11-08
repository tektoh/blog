# == Schema Information
#
# Table name: articles
#
#  id           :bigint(8)        not null, primary key
#  category_id  :bigint(8)
#  author_id    :bigint(8)
#  uuid         :string
#  slug         :string
#  eye_cache    :string
#  title        :string
#  description  :text
#  body         :text
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
    title { generate :title }

    trait :draft do
      state { 'draft' }
    end

    trait :published do
      state { 'published' }
      slug { generate :slug }
      published_at { generate :time }
      category { create :category }
    end
  end
end
