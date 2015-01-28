When "admin creates a category" do
  visit admin_categories_path
  find('a.new-category').click
  fill_in 'category[name]', with: "My new category"
  click_button 'Create Category'
end

When "admin creates a nested category" do
  visit admin_categories_path
  find('a.new-category').click
  fill_in 'category[name]', with: "My new category"
  select HelpKit::Category.first.name, from: 'category[parent_id]'
  click_button 'Create Category'
end

Then(/admin should see (\d+) categor[y|ies]/) do |count|
  visit admin_categories_path
  expect(page).to have_selector('.category-item', count: count)
end

When "admin deletes a category" do
  visit admin_categories_path
  click_link HelpKit::Category.first.name
  find('a[data-method=delete]').click
end

When(/admin renames a category to "(.+)"/) do |name|
  visit admin_categories_path
  click_link HelpKit::Category.first.name
  fill_in 'category[name]', with: name
  click_button 'Update Category'
end

Then(/admin should see a category named "(.+)"/) do |name|
  visit admin_categories_path
  expect(page).to have_link(name)
end
