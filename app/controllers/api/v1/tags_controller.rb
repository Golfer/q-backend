module Api
  module V1
    class TagsController < Api::V1::ApplicationController
      attr_accessor :records

      def default_serializer_options
        {
          serializer: namespace_for_serializer::TagSerializer,
          each_serializer: namespace_for_serializer::TagSerializer
        }
      end

      def index
        respond_with records, meta: pagination_meta(records)
      end

      private

        def records
          @records ||= Tag.reorder(name: :asc).page(params[:page] || 1).per(100)
        end
    end
  end
end
