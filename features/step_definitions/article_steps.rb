Given "an article" do
  FactoryGirl.create(:help_kit_article)
end
When "a guest views an article" do
  visit article_path(HelpKit::Article.last.title)
end
Then "a guest should see the article content" do
  expect(page).to have_content(HelpKit::Article.last.content)
end
