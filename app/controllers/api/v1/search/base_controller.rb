module Api
  module V1
    module Search
      class BaseController < Api::V1::ApplicationController
        RESULTS_PER_PAGE = 10

        respond_to :json

        def default_serializer_options
          { serializer: namespace_for_serializer::Search::BaseSerializer }
        end

        def query
          render json: { data: [] }, each_serializer: namespace_for_serializer::Search::BaseSerializer, status: :ok
        end
      end
    end
  end
end
