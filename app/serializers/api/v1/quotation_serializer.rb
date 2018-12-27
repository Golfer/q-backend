module Api
  module V1
    class QuotationSerializer < Api::ApplicationSerializer
      attributes :id, :body
      has_many :tags, include: true
      has_one :author
    end
  end
end
