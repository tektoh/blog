# frozen_string_literal: true

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

class Article < ApplicationRecord
  include HasUuid, HasEyeCache

  belongs_to :author
  belongs_to :category

  has_many :article_blocks, -> { order(:level) }
  has_many :article_tags
  has_many :codes, through: :article_blocks, source: :blockable, source_type: "Code"
  has_many :embeds, through: :article_blocks, source: :blockable, source_type: "Embed"
  has_many :media, through: :article_blocks, source: :blockable, source_type: "Medium"
  has_many :sentences, through: :article_blocks, source: :blockable, source_type: "Sentence"
  has_many :tags, through: :article_tags

  enum state: { draft: 0, published: 1 }

  validates :slug, slug_format: true, uniqueness: true, length: { maximum: 255 }, allow_blank: true
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :state, presence: true

  with_options if: :published? do |v|
    v.validates :slug, slug_format: true, presence: true, length: { maximum: 255 }
    v.validates :published_at, presence: true
    v.validates :category_id, presence: true
  end

  delegate :name, to: :category, prefix: true, allow_nil: true
  delegate :slug, to: :category, prefix: true, allow_nil: true
  delegate :name, to: :author, prefix: true, allow_nil: true
  delegate :slug, to: :author, prefix: true, allow_nil: true

  scope :viewable, -> { published.where("published_at < ?", Time.current) }
  scope :new_arrivals, -> { viewable.order(published_at: :desc) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :archives_in, ->(year, month = nil) { month.nil? ? archives_in_year(Date.new(year.to_i)) : archives_in_month(Date.new(year.to_i, month.to_i)) }
  scope :archives_in_year, ->(date) { where(published_at: date.all_year) }
  scope :archives_in_month, ->(date) { where(published_at: date.all_month) }
  scope :title_contain, ->(word) { where("title LIKE ?", "%#{word}%") }

  class << self
    def search(search_articles_form)
      relation = Article.distinct

      if search_articles_form.category_id?
        relation = relation.by_category(search_articles_form.category_id)
      end

      search_articles_form.title_words.each do |word|
        relation = relation.title_contain(word)
      end

      relation
    end

    def archives
      all
        .viewable
        .select("DATE_PART('year', articles.published_at) AS year")
        .select("DATE_PART('month', articles.published_at) AS month")
        .group("year, month")
        .order("year, month")
        .map { |article| Date.new(article.year, article.month) }
    end
  end

  def alignment_article_blocks!
    article_blocks.each.with_index(0) do |article_block, level|
      article_block.level = level
      article_block.save!
    end
  end

  def next_article
    @next_article ||= Article.viewable.order(published_at: :asc).where("published_at > ?", published_at).first
  end

  def prev_article
    @prev_article ||= Article.viewable.order(published_at: :desc).where("published_at < ?", published_at).first
  end
end
