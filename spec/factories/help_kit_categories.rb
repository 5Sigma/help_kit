FactoryGirl.define do
  factory :category, :class => 'HelpKit::Category' do
    name { Faker::App.name }
  end

end
