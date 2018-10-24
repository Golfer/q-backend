FactoryGirl.define do
  factory :quotation do
    body FFaker::Lorem.paragraphs(1).first
    title Faker::Name.name
    publicate FFaker::Time.date
    publicated_date FFaker::Time.datetime
    data_quotation { DataQuotation.first || association(:data_quotation) }
  end
end
