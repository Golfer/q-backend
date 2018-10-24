class Author < ApplicationRecord
  has_many :quotations
  validates :first_name, presence: true
end
