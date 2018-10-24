FactoryGirl.define do
  factory :author do
    full_name FFaker::Name
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    link_to_wikipedia FFaker::Internet.http_url
    short_description FFaker::Lorem.paragraphs(1).first
    full_description FFaker::Lorem.paragraphs(1).first
    birthday Faker::Date.birthday(18, 65)
    date_of_death Faker::Date.birthday(18, 65)
    pseudonym FFaker::Name.unique.name
  end
end
