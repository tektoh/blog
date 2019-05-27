# frozen_string_literal: true

module AdminHelper
  def gtag_placeholder
    <<~TEXT
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-XXXXXXXXX-X"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-XXXXXXXXX-X');
    </script>
    TEXT
  end
  def insert_block_button(article, level, blockable_type, opts = {}, &block)
    default_opts = {
      class: %w[btn btn-outline-primary btn-block p-4],
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
      class: %w[btn btn-sm btn-outline-secondary],
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
      class: %w[btn btn-outline-primary],
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
