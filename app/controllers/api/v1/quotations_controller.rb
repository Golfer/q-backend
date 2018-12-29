module Api
  module V1
    class QuotationsController < Api::V1::ApplicationController
      attr_accessor :records

      def default_serializer_options
        {
          serializer: namespace_for_serializer::QuotationSerializer,
          each_serializer: namespace_for_serializer::QuotationSerializer
        }
      end

      def query
        respond_with records, meta: pagination_meta(records)
      end

      private

        def records
          @records ||= Quotation.includes(:author, :tags).reorder(title: :asc).page(params[:page] || 1).per(20)
        end
    end
  end
end
