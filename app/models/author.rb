class Author < ApplicationRecord
  has_many :quotations
  validates :full_name, presence: true
end
