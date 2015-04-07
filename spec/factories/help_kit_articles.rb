FactoryGirl.define do
  factory :help_kit_article, :class => 'HelpKit::Article' do
    title { Faker::Lorem.words(8,true).join(' ') }
    published true
    content { "#{Faker::Lorem.paragraphs(5, true).join("\n\n")}" }
    description { Faker::Lorem.words(8,true).join(' ') }
    published_at "2015-01-25 16:54:16"
    view_count 1
    factory :help_kit_article_unpublished, :class => 'HelpKit::Article' do
      published false
      published_at nil
    end
    after(:create) do |article|
      unless article.category
        parent = create(:category)
        sub = create(:category, parent: parent)
        article.update(category: sub)
        article.tags << create(:tag)
      end
    end
  end

end
