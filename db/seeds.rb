# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |item|
  data_quotation = DataQuotation.create!(link_to_external_resource: 'https://www
.greatest-quotations
.com/search/quotes-dreams.html', description: "description #{item}")
  100.times do |quotation_item|
    Quotation.create(body: "test quotation #{quotation_item}", data_quotation:
      data_quotation)
  end
end
