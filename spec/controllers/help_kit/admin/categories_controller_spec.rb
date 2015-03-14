require 'rails_helper'

module HelpKit
  RSpec.describe Admin::CategoriesController, :type => :controller do

    describe "#index" do
      let(:category) { create(:category) }
      before {
        create(:category, parent_id:category.id)
        get :index
      }
      it "should assing @categories" do
        expect(assigns(:categories)).to eq([category])
      end
      it "should not contain sub category" do
        expect(assigns(:categories).count).to eq(1)
      end
      it { should render_template('index') }
    end

    describe "#new" do
      before {get :new}
      it "should assing @categories" do
        expect(assigns(:category)).to be_a_new(Category)
      end
      it { should render_template('new') }
    end

    describe "#create" do
      let(:attributes) {{ category: attributes_for(:category) }}
      context "with valid attributes" do
        before do
          post :create, attributes
        end
        it { should redirect_to admin_categories_path }
      end
      context "with invalid attributes" do
        before do
          expect_any_instance_of(Category).to receive(:save) { false }
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
    describe "#update" do
      let(:category) { create :category }
      let(:attributes) {{ category: attributes_for(:category), id: category.id}}
      context "with valid attributes" do
        it "should call update on record" do
          expect_any_instance_of(Category).to receive(:update) {true}
          patch :update, attributes
        end
        it "should redirect to index" do
          patch :update, attributes
          expect(response).to redirect_to(admin_categories_path)
        end
      end
      context "with invalid attributes do" do
        before do
          expect_any_instance_of(Category).to receive(:update) {false}
          patch :update, attributes
        end
        it { should render_template('edit') }
      end
    end

    describe "#destroy" do
      let(:category) { create :category }
      it "should receive #destroy" do
        expect_any_instance_of(Category).to receive(:destroy) { true }
        delete :destroy, id: category.id
      end
    end

  end
end
