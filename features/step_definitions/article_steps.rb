Given "an article" do
  FactoryGirl.create(:help_kit_article)
end
When "a guest views an article" do
  visit article_path(HelpKit::Article.last)
end
Then "a guest should see the article content" do
  expect(page).to have_content(HelpKit::Article.last.content)
end

When "admin creates a new article" do
  attributes = FactoryGirl.attributes_for(:help_kit_article)
  visit article_path(attributes[:title])
  click_link 'Create Article'
  fill_in "article[content]", with: attributes[:content]
  click_button 'Create Article'
  save_and_open_page
end

When "admin should see article content" do
  attributes = FactoryGirl.attributes_for(:help_kit_article)
  expect(page).to have_content(attributes[:content])
end

When "admin updates article content" do
  visit article_path(HelpKit::Article.last.title)
  click_link 'edit'
  fill_in('article[content]', with: 'updated content')
  click_button 'Update Article'
end

Then "admin should see updated article content" do
  expect(page).to have_content('updated content')
end
