FactoryGirl.define do
  factory :article_tag, :class => 'HelpKit::ArticleTag' do
    tag
    article
  end

end
