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
  describe "#search" do
    let(:article) {
      create(:help_kit_article,
             title: 'Some article title',
             description: 'Test description',
             content: 'Article content test' )
    }
    it "should match description text search" do
      expect(Article.search("descr")).to eq([article])
    end
    it "should match content text search" do
      expect(Article.search("content")).to eq([article])
    end
    it "should match title text search" do
      expect(Article.search("Some")).to eq([article])
    end

    describe "#publish!" do
      before { article.publish! }
      it "should set published_at" do
        expect(article.published_at).to_not be_nil
      end
      it "should set published to true" do
        expect(article.published).to eq(true)
      end
    end
    describe "#unpublish!" do
      before { article.publish!; article.unpublish! }
      it "should unset published_at" do
        expect(article.published_at).to be_nil
      end
      it "should set published to false" do
        expect(article.published).to eq(false)
      end
    end
    describe "#published" do
      let(:published_article) {
        create(:help_kit_article, published: true)
      }
      it "should include published article" do
        expect(Article.published).to include(published_article)
      end
      it "should not include unpublished articles" do
        article.unpublish!
        expect(Article.published).to_not include(article)
      end
    end
    describe "#unpublished" do
      let(:published_article) {
        create(:help_kit_article, published: true)
      }
      it "should not include published article" do
        expect(Article.unpublished).to_not include(published_article)
      end
      it "should include unpublished articles" do
        article.unpublish!
        expect(Article.unpublished).to include(article)
      end
    end
  end
end
