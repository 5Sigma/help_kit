module HelpKit
  module SplitViewHelper
    def split_view_menu_item(text, path, active_controller)
      css = "menu-item"
      css << " active" if active_controller == controller_name
      content_tag :div, class: css do
        link_to text, path
      end
    end
  end
end
