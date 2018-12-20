module Api
  module V1
    module Search
      class QuotationSerializer < Api::V1::ApplicationSerializer
        attributes :id, :title, :publicated_date, :publicate
      end
    end
  end
end
