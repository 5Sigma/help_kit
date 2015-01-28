require 'rails_helper'

module HelpKit
  RSpec.describe Admin::CategoriesController, :type => :controller do

    describe "#index" do
      before { get :index }
      let(:category) { create(:category) }
      it "should assing @categories" do
        expect(assigns(:categories)).to eq([category])
      end
      it { should render_template('index') }
    end

    describe "#new" do
      before {get :new}
      it "should assing @categories" do
        expect(assings(:categories)).to be_a_new(Category)
      end
      it { should render_template('new') }
    end

    describe "#create" do
      let(:attributes) {{ category: attributes_for(:category) }}
      context "with valid attributes" do
        before do
          post :create, attributes
        end
        it { should redirect_to help_kit.admin_categories_path }
      end
      context "with invalid attributes" do
        before do
          expect_any_instance_of(Article).to receive(:save) { false }
          post :create, attributes
        end
        it { should render_template('new') }
        it "should assign @category" do
          expect(assigns(:category)).to be_a_new(Category)
        end
      end
    end

    describe "#edit" do
      let(:category) { create(:category) }
      before { get :edit, id: category.id }
      it { should render_template('edit') }
      it "should assing @category" do
        expect(assigns(:category)).to eq(category)
      end
    end

  end
end
