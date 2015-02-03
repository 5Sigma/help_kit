require 'rails_helper'

module HelpKit
  RSpec.describe Article, :type => :model do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should belong_to :category }
    it { should have_many :article_tags }
    it { should have_many :tags }
    it { should belong_to :parent_article }

    describe "#for_category" do
      let(:category) { create(:category) }
      let(:article) { create(:help_kit_article, category: category) }
      let(:sub_category) { create(:category, parent: category) }

      it "should include articles in category" do
        expect(Article.all.for_category(category)).to include(article)
      end
      it "should include articles in sub-categories" do
        sub_article = create(:help_kit_article, category: sub_category)
        category.reload
        expect(Article.for_category(category)).to include(sub_article)
      end
    end
    it "should regenerate slug on update" do
      article = create(:help_kit_article)
      article.update(title: 'this is a test')
      article.reload
      expect(article.friendly_id).to eq('this-is-a-test')
    end
  end
end
