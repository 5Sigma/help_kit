require 'rails_helper'

module HelpKit
  RSpec.describe Admin::CategoriesController, :type => :controller do
    let(:category) { create(:category) }
    context "authorized" do
      before {
        allow(HelpKit).to receive(:is_authorized?)
          .and_return(true)
      }
      describe "#index" do
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
        before { get :new }
        it "should assing @categories" do
          expect(assigns(:category)).to be_a_new(Category)
        end
        it { should render_template('new') }
      end

      describe "#create" do
        let(:attributes) {{ category: attributes_for(:category) }}
        context "with valid attributes" do
          it "should redirect to category list" do
            post :create, attributes
            expect(response).to redirect_to(admin_categories_path)
          end
          it "should create category record" do
            expect {
              post :create, attributes
            }.to change(Category, :count).by(1)
          end
        end
        context "with invalid attributes" do
          before do
            expect_any_instance_of(Category).to receive(:save) { false }
          end
          it "should render new template" do
            post :create, attributes
            expect(response).to render_template('new')
          end
          it "should assign @category" do
            post :create, attributes
            expect(assigns(:category)).to be_a_new(Category)
          end
          it "should not create database record" do
            expect {
              post :create, attributes
            }.to change(Category, :count).by(0)
          end
        end
      end

      describe "#edit" do
        before { get :edit, id: category.id }
        it { should render_template('edit') }
        it "should assing @category" do
          expect(assigns(:category)).to eq(category)
        end
      end

      describe "#update" do
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
        it "should receive #destroy" do
          expect_any_instance_of(Category).to receive(:destroy) { true }
          delete :destroy, id: category.id
        end
        it "should redirect to category list" do
          delete :destroy, id: category.id
          expect(response).to redirect_to(admin_categories_path)
        end
      end

    end

    context "unauthorized" do
      before {
        allow(HelpKit).to receive(:is_authorized?)
          .and_return(false)
      }
      let(:attributes) {{
        id: category.id,
        category: attributes_for(:category)
      }}
      %w{index edit update new create destroy}.each do |action|
        describe "##{action}" do
          before {
            if %w{index edit new}.include? action
              get action.to_sym, attributes
            end
            if %w{update create}.include? action
              post action.to_sym, attributes
            end
            if action == 'destroy'
              delete :destroy, attributes
            end
          }
          it { should redirect_to landing_path }
        end
      end
    end
  end
end
