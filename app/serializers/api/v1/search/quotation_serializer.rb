module Api
  module V1
    module Search
      class QuotationSerializer < Api::ApplicationSerializer
        attributes :id, :title, :publicated_date, :publicate
      end
    end
  end
end
