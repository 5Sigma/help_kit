require 'rails_helper'

RSpec.describe "help_kit/articles/index_category.html.slim", :type => :view do
  let(:parent_category) { create(:category) }
  let(:sub_category) { create(:category, parent: parent_category) }
  let(:article) { create(:help_kit_article, category: sub_category) }
  context "viewing parent category" do
    before {
      view.extend HelpKit::ArticleHelper
      article
      parent_category.reload
      assign(:category, parent_category)
      assign(:articles, HelpKit::Article.for_category(parent_category))
      render
    }
    subject { rendered }
    it {should have_selector('.category.active', text: parent_category.name)}
    it "should display articles in sub-categories" do
      expect(rendered).to have_selector('.article-item .title a',
                                        text: article.title)
    end
  end
end
