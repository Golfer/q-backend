FactoryGirl.define do
  factory :data_quotation do
    description FFaker::Lorem.paragraphs(1).first
    link_to_external_resource FFaker::Internet.unique.http_url
  end
end
