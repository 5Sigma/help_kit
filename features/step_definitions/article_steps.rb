Given(/^an (unpublished|published)?\s?article$/) do |flag|
  article = FactoryGirl.create(:help_kit_article)
  if flag == 'unpublished'
    article.unpublish!
  end
  if flag == "published"
    article.publish!
  end
end
When "a guest views an article" do
  visit article_path(HelpKit::Article.last)
end
Then "a guest should see the article content" do
  expect(page).to have_content(HelpKit::Article.last.title)
end

When "admin creates a new article" do
  FactoryGirl.create(:category)
  attributes = FactoryGirl.attributes_for(:help_kit_article)
  visit article_path(id: attributes[:title])
  click_link 'Create Article'
  find('.article-details').click
  select2(HelpKit::Category.first.name, '#s2id_article_category_id')
  fill_in 'article[description]', with: attributes[:description]
  click_link 'Close'
  find('#editor').native.send_keys attributes[:content]
  find('a.save-article').click
end

When "admin should see article content" do
  expect(page).to have_content(HelpKit::Article.last.title)
end

When "admin deletes an article" do
  visit article_path(HelpKit::Article.last)
  find('a.edit-article').click
  find('a.delete-article').click
end

When "admin updates article content" do
  visit article_path(HelpKit::Article.last)
  find('a.edit-article').click
  find('#editor').native.send_keys 'updated content'
  find('a.save-article').click
end

Then "admin should see updated article content" do
  expect(page).to have_content('updated content')
end

Given "guest views a category" do
  category = HelpKit::Category.first
  visit category_path(category)
end

Then(/should see (\d+) article[s]?/) do |count|
  expect(page).to have_selector('.article-item', count: count)
end

When(/^admin publishes an article$/) do
  visit article_path(HelpKit::Article.unpublished.last)
  find('a.publish-article').click
end

When(/^admin unpublishes an article$/) do
  visit article_path(HelpKit::Article.last)
  find('a.unpublish-article').click
end

