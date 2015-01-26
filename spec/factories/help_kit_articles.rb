FactoryGirl.define do
  factory :help_kit_article, :class => 'HelpKit::Article' do
    title "Article title"
    published true
    content "Article content"
    published_at "2015-01-25 16:54:16"
    view_count 1
  end

end
