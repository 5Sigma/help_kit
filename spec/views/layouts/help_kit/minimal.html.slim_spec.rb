require 'rails_helper'
module HelpKit
  RSpec.describe "layouts/help_kit/minimal.html.slim", :type => :view do
    before {
      view.extend HelpKit::ArticleHelper
      view.extend HelpKit::AuthorizationHelper
    }
    context "authorized" do
      before {
        allow(view).to receive(:is_authorized?)
          .and_return(true)
        render
      }
      subject  { rendered }
      it { should have_selector('.submenu') }
    end
  end
end
