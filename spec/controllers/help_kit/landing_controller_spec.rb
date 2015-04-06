require 'rails_helper'

module HelpKit
  RSpec.describe LandingController, :type => :controller do
    describe "#land" do
      before {
        create_list(:help_kit_article,10)
        create_list(:help_kit_article,10, published: true)
        get :land
      }
      it { should render_template('land') }
      it { should render_with_layout('help_kit/minimal') }
      it "should assign @popular" do
        expect(assigns(:popular).count).to eq(5)
      end
      it "should assign @recent" do
        expect(assigns(:recent).count).to eq(5)
      end
    end
  end
end
