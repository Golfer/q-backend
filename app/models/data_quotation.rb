class DataQuotation < ApplicationRecord
  has_many :quotations
  validates :link_to_external_resource, presence: true
end
