require 'rails_helper'

module HelpKit
  RSpec.describe ArticlesController, :type => :controller do
    let(:article) { create(:help_kit_article) }
    describe "#show" do
      context "with existing article" do
        before { get :show, title: article.title }
        it { should render_template('show') }
        it { should render_with_layout('help_kit/application') }
        it "should assign article" do
          expect(assigns(:article)).to eq(article)
        end
      end
      context "without article" do
        before { get :show, title: 'new-article'}
        it { should render_template('create') }
        it "should assign @article" do
          expect(assigns(:article)).to be_a_new(Article)
        end
      end
    end
    describe "#edit" do
      context "with existing article" do
        let(:article) { create(:help_kit_article) }
        before { get :edit, title: article.title }
        it { should render_template('edit') }
        it "should assign @article" do
          expect(assigns(:article)).to eq(article)
        end
      end
      context "without article" do
        before { get :edit, title: 'some-article' }
        it { should render_template('create') }
        it " should assign @article" do
          expect(assigns(:article)).to be_a_new(Article)
        end
      end
    end

    describe "#update" do
      let(:attributes) {{ article: { content: 'test' }, title: article.title }}
      context "with valid attributes" do
      before { patch :update, attributes }
      it { should redirect_to article_path(article) }
      end
      context "with invalid attributes" do
        before {
          expect_any_instance_of(Article).to receive(:save) { false }
          patch :update, attributes
        }
        it { should render_template('edit') }
        it "should assign @article" do
          expect(assigns(:article)).to eq(article)
        end
      end
    end

  end
end
