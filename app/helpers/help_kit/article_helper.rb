module HelpKit
  module ArticleHelper
    def category_breadcrumb(current_category)
      content_tag :ul do
        current_category.self_and_ancestors.each do |category|
          concat content_tag(:li, link_to(category.name, ''))
        end
      end
    end
  end
end
