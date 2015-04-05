Then(/should see flash message "(.*)"/) do |message|
  expect(page).to have_selector('.flash', text: message)
end
