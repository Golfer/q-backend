module Api
  module V1
    class QuotationsController < Api::V1::ApplicationController
      attr_accessor :records

      def default_serializer_options
        { serializer: namespace_for_serializer::QuotationSerializer }
      end

      def query
        render json: { data: records }, each_serializer: namespace_for_serializer::QuotationSerializer, status: :ok
      end

      private

        def records
          @records ||= Quotation.reorder(title: :asc)
                         .limit(1000)
                         # .page(params[:page] || 1)
                         # .per(RESULTS_PER_PAGE)
        end
    end
  end
end
