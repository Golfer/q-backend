class QuotationsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :quotation
end
