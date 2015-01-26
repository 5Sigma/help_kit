require 'rails_helper'

RSpec.describe "help_kit/articles/show.html.slim", :type => :view do
  let(:article) { create(:help_kit_article) }
  before {
    assign(:article, article)
    render
  }
  subject { rendered } 
  it { should have_content(article.content) }
  it { should have_content(article.title) }
end
