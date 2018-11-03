class Quotation < ApplicationRecord
  PER_PAGE = '15'.freeze
  belongs_to :data_quotation, optional: true
  belongs_to :author, optional: true

  validates :body, presence: true

  scope :publicate, -> { where(publicate: true) }
  scope :unpublicate, -> { where(publicate: false) }
end
