When "admin creates a category" do
  visit admin_categories_path
  find('a.new-category').click
  fill_in 'category[name]', with: "My new category"
  find('a.save-category').click
end

When "admin creates a nested category" do
  visit admin_categories_path
  find('a.new-category').click
  fill_in 'category[name]', with: "My new category"
  select2 HelpKit::Category.first.name,'#s2id_category_parent_id'
  find('a.save-category').click
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
  find('a.save-category').click
end

Then(/admin should see a category named "(.+)"/) do |name|
  visit admin_categories_path
  expect(page).to have_link(name)
end
