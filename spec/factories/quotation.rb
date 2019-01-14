FactoryGirl.define do
  factory :quotation do
    body FFaker::Lorem.paragraphs(1).first
    title Faker::Name.name
    data_quotation { DataQuotation.first || association(:data_quotation) }
    author { Author.first || association(:author) }
  end
end
