FactoryGirl.define do
  factory :help_kit_article, :class => 'HelpKit::Article' do
    title "Article title"
    published false
    content "Article content"
    published_at "2015-01-25 16:54:16"
    creator_id 1
    last_editor_id 1
    view_count 1
    category nil
    parent_article_id 1
  end

end
