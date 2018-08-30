class CodeDecorator < Draper::Decorator
  delegate_all

  def box_header_icon
    h.content_tag 'i', nil, class: %w[fa fa-code]
  end

  def box_title
    'コード'
  end

  def body_highlighted
    formatter.format(lexer.lex(body))
  end

  def formatter
    Rouge::Formatters::HTMLInline.new(Rouge::Themes::MonokaiSublime)
  end

  def lexer
    "Rouge::Lexers::#{code_mode.rouge.to_s.classify}".constantize.new
  end
end
