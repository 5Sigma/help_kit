require 'rails_helper'

module HelpKit
  RSpec.describe ArticlesController, :type => :controller do
    let(:article) { create(:help_kit_article) }
    describe "#show" do
      context "with existing article" do
        before { get :show, id: article}
        it { should render_template('show') }
        it { should render_with_layout('help_kit/minimal') }
        it { should rescue_from(ActiveRecord::RecordNotFound).with(:not_found) }
        it "should assign article" do
          expect(assigns(:article)).to eq(article)
        end
      end
      context "for non-existing article" do
        before { get :show, id: 1230 }
        it { should render_template('not_found') }
      end
    end
    describe "#edit" do
      context "with existing article" do
        let(:article) { create(:help_kit_article) }
        before { get :edit, id: article }
        it { should render_template('edit') }
        it "should assign @article" do
          expect(assigns(:article)).to eq(article)
        end
      end
    end

    describe "#update" do
      context "for existing article" do
        let(:attributes) {{ article: { content: 'test' }, id: article }}
        context "with valid attributes" do
          before { patch :update, attributes }
          it { should redirect_to article_path(article) }
        end
        context "with invalid attributes" do
          before {
            allow_any_instance_of(Article).to receive(:update) { false }
          }
          it "should render edit template" do
            patch :update, attributes
            expect(response).to render_template('edit')
          end
          it "should assign @article" do
            patch :update, attributes
            expect(assigns(:article)).to eq(article)
          end
        end
      end
    end
    describe "#new" do
      before { get :new }
      it { should render_template('new') }
      it "should assign(@article)" do
        expect(assigns(:article)).to be_a_new(Article)
      end
    end
    describe "#create" do
      let(:attributes) {{ article: attributes_for(:help_kit_article) }}
      context "with valid attributes" do
        it "should create an article record" do
          expect {
            post :create, attributes
          }.to change(Article, :count).by(1)
        end
      end
      context "with invalid attributes" do
        before {
          expect_any_instance_of(Article).to receive(:save) { false }
          post :create, attributes
        }
        it { should render_template('new') }
        it "should assign @article" do
          expect(assigns(:article)).to be_a_new(Article)
        end
      end
    end
    describe "#index_category" do
      let(:article) { create(:help_kit_article) }
      it "should include articles in category" do
        expect(Article).to receive(:for_category).with(article.category)
        get :index_category, category: article.category
      end
    end
    describe "#delete" do
      before {
        article
      }
      context "authorized user" do
        before {
          allow_any_instance_of(ApplicationController)
            .to receive(:is_authorized?).and_return(true)
        }
        it "should remove article record" do
          expect {
            delete :destroy, id: article
          }.to change(Article, :count).by(-1)
        end
        it "should redirect to admin_landing" do
          delete :destroy, id: article
          expect(response).to redirect_to admin_landing_path
        end
        it "should set flash message" do
          delete :destroy, id: article
          expect(flash[:success]).to_not be_nil
        end
      end
      context "when unauthorized" do
        before {
          allow_any_instance_of(ApplicationController)
            .to receive(:is_authorized?).and_return(false)
        }
        it "should redirect to landing page" do
          delete :destroy, id: article
          expect(response).to redirect_to landing_path
        end
        it "should not remove article from the database" do
          expect {
            delete :destroy, id: article
          }.to change(Article, :count).by(0)
        end
      end
    end
  end
end
