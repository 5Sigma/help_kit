module HelpKit
  module ArticleHelper
    def category_breadcrumb(current_category)
      content_tag :ul do
        concat content_tag(:li, link_to(icon('home'), landing_path))
        current_category.self_and_ancestors.each do |category|
          concat content_tag(:li,
                             link_to(category.name, category_path(category)))
        end
      end
    end
  end
end
