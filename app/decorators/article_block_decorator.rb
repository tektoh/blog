module ArticleBlockDecorator
  def box_header_icon
    if sentence?
      '<i class="fa fa-edit"></i>'.html_safe
    end
  end

  def box_title
    if sentence?
      '文章'
    end
  end
end
