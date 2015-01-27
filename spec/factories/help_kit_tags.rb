FactoryGirl.define do
  factory :tag, :class => 'HelpKit::Tag' do
    name {Faker::Hacker.noun}
  end
end
