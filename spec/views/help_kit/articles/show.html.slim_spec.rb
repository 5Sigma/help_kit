require 'rails_helper'

RSpec.describe "help_kit/articles/show.html.slim", :type => :view do
  let(:article) { create(:help_kit_article) }
  before {
      view.extend HelpKit::ArticleHelper
      view.extend HelpKit::AuthorizationHelper
      assign(:article, article)
  }

  context "unauthorized user" do
    before {
      allow(view).to receive(:is_authorized?)
        .and_return(false)
      render
    }
    subject { rendered }
    it { should have_content(article.title) }

    context "submenu" do
      subject { view.content_for(:submenu) }
      it { should_not have_selector('a.edit-article') }
      it { should_not have_selector('a.publish-article') }
      it { should_not have_selector('a.unpublish-article') }
    end
  end


  context "authorized user" do
    before {
      allow(view).to receive(:is_authorized?)
        .and_return(true)
      render
    }
    context "unpublished article" do
        before {
          allow(article).to receive(:is_published?)
            .and_return(false)
          render
        }
        subject { rendered }
        it { should have_selector("div.info") }
    end

    context "submenu" do
      subject { view.content_for(:submenu) }
      it { should have_selector('a.edit-article') }

      context "published" do
        before {
          allow(article).to receive(:is_published?).and_return(false)
          render
        }
        it { should have_selector('a.publish-article') }
      end

      context "unpublished" do
        before {
          allow(article).to receive(:is_published?).and_return(false)
          render
        }
        it { should have_selector('a.unpublish-article') }
      end
    end
  end
end
