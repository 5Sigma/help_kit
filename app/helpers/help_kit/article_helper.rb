module HelpKit
  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      require 'pygmentize'
      Pygmentize.process(code, language)
    end
  end
  module ArticleHelper
    def category_breadcrumb(current_category, opts = {})
      content_tag :ul do
        unless opts[:hide_home]
          concat content_tag(:li, link_to(icon('home'), landing_path))
        end
        current_category.self_and_ancestors.each do |category|
          concat content_tag(:li,
                             link_to(category.name, category_path(category)))
        end
      end
    end
    def render_markdown(content)
      markdown = Redcarpet::Markdown.new(PygmentizeHTML,
                                         autolink: true,
                                         tables: true,
                                         fenced_code_blocks: true)
      markdown.render(content)


    end
  end
end
