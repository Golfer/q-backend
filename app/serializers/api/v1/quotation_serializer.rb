module Api
  module V1
    class QuotationSerializer < Api::V1::ApplicationSerializer
      attributes :id, :title, :body, :publicated_date, :author, :publicate
    end
  end
end
