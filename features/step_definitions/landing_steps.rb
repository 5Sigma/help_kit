When "user lands" do
  visit help_kit.landing_path
end

Then(/should see (\d+) (popular|recent) article[s]?/) do |count, flag|
  expect(page).to have_selector(".#{flag} .article-item", count: count)
end
