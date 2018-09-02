class Admin::Articles::ArticleBlocksController < ApplicationController
  layout false

  def index; end

  def show; end

  def create
    ArticleBlock.transaction do
      article_block = article.article_blocks.build(article_block_params)

      if article_block.invalid?(:insert)
        return head :bad_request
      end

      blockable_type = params.dig(:article_block, :blockable_type)

      if blockable_type.blank? || !ArticleBlock.valid_blockable_type?(blockable_type)
        return head :bad_request
      end

      article_block.create_blockable!(blockable_type)
      article_block.insert_and_save!
    end

    head :ok
  end

  def edit; end

  def update
    if article_block.blockable.update(blockable_params)
      if article_block.medium?
        # FIXME remote: true では Ajaxでファイルアップロードができない
        # NoContent の場合はフロント側でリロードする
        head :ok
      else
        render action: :show
      end
    else
      render action: :edit
    end
  end

  def destroy
    ArticleBlock.transaction do
      article_block.destroy!
      article_block.article.alignment_article_blocks!
    end
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

  def article
    @article ||= Article.find_by!(uuid: params[:article_uuid]).decorate
  end
  helper_method :article

  def article_blocks
    @article_blocks ||= article.article_blocks.preload(:blockable).decorate
  end
  helper_method :article_blocks

  def article_block
    @article_block ||= article.article_blocks.find(params[:id])
  end
  helper_method :article_block

  def article_block=(v)
    @article_block = v
  end

  def article_block_params
    params.require(:article_block).permit(:level)
  end

  def blockable_params
    type = ArticleBlock.blockable_types.map(&:underscore).find { |type| params.key?(type) }

    if type.blank?
      raise ActionController::ParameterMissing.new(:blockable)
    end

    send(:"#{type}_params")
  end

  def sentence_params
    params.require(:sentence).permit(:body)
  end

  def medium_params
    params.require(:medium).permit(:media_type, :attachment, :attachment_url)
  end

  def embed_params
    params.require(:embed).permit(:embed_type, :identifier)
  end

  def code_params
    params.require(:code).permit(:mode, :body)
  end
end
