require 'redcarpet'
module ApplicationHelper
  def markdown(text)
    if text == nil
      return 
    end
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, escape_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  
  def destroy_glyph
    return raw '<span class="glyphicon glyphicon-trash"></span>'
  end
  
  def edit_glyph
    return raw '<span class="fui-new"></span>'
  end
  
  def pin_glyph
    return raw '<span class="glyphicon glyphicon-pushpin"></span>'
  end
  
  def rejudge_glyph
    return raw '<span class="glyphicon glyphicon-repeat"></span>'
  end
  
  
end
