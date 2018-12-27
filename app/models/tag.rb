class Tag < ApplicationRecord
  has_many :quotations_tags
  has_and_belongs_to_many :quotations, through: :quotations_tags

  validates :name, presence: true, length: { maximum: 128 }
  validates :name, uniqueness: true
end
