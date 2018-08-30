module ArticleBuilder
  extend ActiveSupport::Concern

  def build_article_body(article)
    article.article_blocks.decorate.inject('') do |result, article_block|
      result << if article_block.sentence?
                  sentence = article_block.blockable
                  render_to_string("shared/_sentence", locals: { sentence: sentence }, layout: false)
                elsif article_block.medium?
                  medium = article_block.blockable
                  render_to_string("shared/_medium_#{medium.media_type}", locals: { medium: medium }, layout: false)
                elsif article_block.embed?
                  embed = article_block.blockable
                  render_to_string("shared/_embed_#{embed.embed_type}", locals: { embed: embed }, layout: false)
                elsif article_block.code?
                  code = article_block.blockable
                  render_to_string("shared/_code", locals: { code: code }, layout: false)
                else
                  ''
                end
    end
  end
end
