require 'rails_helper'

module HelpKit
  RSpec.describe LandingController, :type => :controller do
    describe "#land" do
      before { get :land }
      it { should render_template('land') }
      it { should render_with_layout('help_kit/minimal') }
    end
  end
end
