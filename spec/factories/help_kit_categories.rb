FactoryGirl.define do
  factory :category, :class => 'HelpKit::Category' do
    name { Faker::App.name }
    header_content {
      "<p>#{Faker::Lorem.paragraphs(3,true).join('</p></p>')}</p>"
    }
  end

end
