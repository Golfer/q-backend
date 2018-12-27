module Api
  module V1
    module Search
      class QuotationsController < Api::V1::Search::BaseController
        attr_accessor :records

        def default_serializer_options
          { serializer: namespace_for_serializer::Search::QuotationSerializer }
        end

        def query
          render json: { data: records }, each_serializer: namespace_for_serializer::Search::QuotationSerializer, status: :ok
        end

        private

          def records
            @records ||= Quotation.reorder(title: :asc).search_by_name(params[:q])
          end
      end
    end
  end
end
