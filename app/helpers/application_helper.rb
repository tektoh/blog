module ApplicationHelper
  def default_meta_tags
    {
      site: current_site.name,
      reverse: true,
      title: nil,
      description: current_site.description,
      canonical: request.original_url,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: current_site.og_image? ? current_site.og_image.url : nil,
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end

  def flash_class(key)
    { alert: 'danger', notice: 'success' }.fetch(key.to_sym) { 'danger' }
  end

  def cover_image_url
    current_site.present? ? current_site.cover_image.url : nil
  end

  def insert_block_button(article, level, blockable_type, opts = {}, &block)
    default_opts = {
      class: %w[btn btn-app btn-default],
      data: {
        remote: true,
        disable: true,
        method: :post,
        params: {
          article_block: {
            level: level,
            blockable_type: blockable_type
          }
        }.to_param
      }
    }

    klass = opts.delete(:class)
    default_opts[:class].concat(Array(klass)) if klass
    opts = default_opts.merge(opts)

    link_to admin_article_article_blocks_path(article.uuid), opts do
      capture(&block)
    end
  end

  def swap_block_button(article, article_block, level, opts = {}, &block)
    default_opts = {
      class: %w[btn btn-sm btn-default],
      data: {
        remote: true,
        disable: true,
        method: :patch,
        params: { article_block: { level: article_block.level + level } }.to_param
      }
    }

    klass = opts.delete(:class)
    default_opts[:class].concat(Array(klass)) if klass
    opts = default_opts.merge(opts)

    link_to admin_article_article_block_swap_level_path(article.uuid, article_block), opts do
      capture(&block)
    end
  end

  def remove_block_button(article, article_block, opts = {}, &block)
    default_opts = {
      class: %w[btn btn-sm btn-danger],
      data: {
        remote: true,
        disable: true,
        method: :delete
      }
    }

    klass = opts.delete(:class)
    default_opts[:class].concat(Array(klass)) if klass
    opts = default_opts.merge(opts)

    link_to admin_article_article_block_path(article.uuid, article_block), opts do
      capture(&block)
    end
  end

  def edit_block_button(article, article_block, opts = {}, &block)
    default_opts = {
      class: %w[btn btn-default],
      data: {
        remote: true,
        disable: true
      }
    }

    klass = opts.delete(:class)
    default_opts[:class].concat(Array(klass)) if klass
    opts = default_opts.merge(opts)

    link_to edit_admin_article_article_block_path(article.uuid, article_block), opts do
      capture(&block)
    end
  end

  def simple_blockable_form_for(article, article_block, blockable, html_opts = {}, &block)
    simple_form_for blockable,
                    html: html_opts,
                    url: admin_article_article_block_path(article.uuid, article_block),
                    data: {
                      remote: true,
                      type: :html,
                      disable: true
                    } do |f|
      capture(f, &block)
    end
  end
end
