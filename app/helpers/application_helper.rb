module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    md = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    md.render(text).html_safe
  end
end
