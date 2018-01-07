class Admin::Articles::ArticleBlocksController < ApplicationController
  layout false

  before_action :set_article
  before_action :set_article_block, only: %i[show edit update destroy]

  def index
    @article_blocks = @article.article_blocks.preload(:blockable)
  end

  def show; end

  def create
    ArticleBlock.transaction do
      @article_block = @article.article_blocks.new(article_block_params)

      if @article_block.invalid?(:insert)
        return head :bad_request
      end

      blockable_type = params.dig(:article_block, :blockable_type)

      if blockable_type.blank? || !ArticleBlock.valid_blockable_type?(blockable_type)
        return head :bad_request
      end

      @article_block.create_blockable!(blockable_type)
      @article_block.insert_and_save!
    end

    head :ok
  end

  def edit; end

  def update
    blockable_params = if params.key?(:sentence)
                         sentence_params
                       end

    if @article_block.blockable.update(blockable_params)
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    @article_block.destroy!
    head :ok
  end

  def swap_level
    article_block1 = @article.article_blocks.find(params[:article_block_id])

    level = article_block_params[:level]

    if level.blank? || level.to_i.negative? || level.to_i >= @article.article_blocks.count
      return head :bad_request
    end

    article_block2 = @article.article_blocks.find_by!(level: level)

    if article_block1 == article_block2
      return head :bad_request
    end

    article_block2.level = article_block1.level
    article_block1.level = level

    ArticleBlock.transaction do
      article_block1.save!(context: :swap_level)
      article_block2.save!(context: :swap_level)
    end

    head :ok
  end

  private

  def article_block_params
    params.require(:article_block).permit(:level)
  end

  def sentence_params
    params.require(:sentence).permit(:body)
  end

  def set_article
    @article = Article.find_by!(uuid: params[:article_uuid])
  end

  def set_article_block
    @article_block = @article.article_blocks.find(params[:id])
  end
end
