class Quotation < ApplicationRecord
  belongs_to :data_quotation, optional: true
  belongs_to :author, optional: true

  validates :body, presence: true

  scope :publicate, -> { where(publicate: true) }
end
