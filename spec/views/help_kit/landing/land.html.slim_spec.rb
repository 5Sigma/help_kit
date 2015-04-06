require 'rails_helper'

RSpec.describe "help_kit/landing/land.html.slim", :type => :view do
  context "with articles" do
    before {
      articles = build_list(:help_kit_article, 5, published: true,
                            slug: 'test')
      assign(:popular, articles)
      assign(:recent, articles)
      render
    }
    subject { rendered }
    it { should have_selector('.section.popular .article-item', count: 5) }
    it { should have_selector('.section.recent .article-item', count: 5) }
    it { should have_selector('.grid-list.categories') }
  end
  context "without articles do" do
    before {
      assign(:popular, [])
      assign(:recent, [])
      render
    }
    subject { rendered }
    it { should_not have_selector('.section.popular') }
    it { should_not have_selector('.section.recent') }
    it { should_not have_selector('.grid-list.categories') }
    it { should have_selector('.no-articles') }
  end



end
