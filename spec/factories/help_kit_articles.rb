FactoryGirl.define do
  factory :help_kit_article, :class => 'HelpKit::Article' do
    title "Article title"
    published true
    content { Faker::Lorem.paragraphs(5, true) }
    published_at "2015-01-25 16:54:16"
    view_count 1
    after(:create) do |article|
      parent = create(:help_kit_category)
      sub = create(:help_kit_category, parent: parent)
      article.update(category: sub)
    end
  end

end
