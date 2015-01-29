module HelpKit
  module CategoryHelper
    def category_options(category)
      nested_set_options(HelpKit::Category, category) {|i|
        "#{'&nbsp;' * i.level * 2} #{i.name}".html_safe
      }
    end
  end
end
