class Quotation < ApplicationRecord
  PER_PAGE = '15'.freeze
  belongs_to :data_quotation, optional: true
  belongs_to :author

  has_many :quotations_tags
  has_and_belongs_to_many :tags, -> { distinct }, through: :quotations_tags

  validates :body, presence: true

  scope :publicate, -> { where(publicate: true) }
  scope :unpublicate, -> { where(publicate: false) }
end
