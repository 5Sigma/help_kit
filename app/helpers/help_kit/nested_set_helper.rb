module HelpKit
  module NestedSetHelper
    def nested_li(objects, &block)
      output = "<ul>"
      objects.each do |o|
        output += content_tag(:li) {
          concat(capture(o, &block))
          unless o.leaf?
            concat(nested_li(o.children, &block))
          end
        }
      end
      output += "</ul>"
      return output.html_safe
    end
  end
end
