module Api
  class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    include Rails.application.routes.url_helpers

    respond_to :json

    before_action :set_namespace_for_serializer

    def render_unprocessable_entity_response(exception)
      render json: exception.record.errors, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
      render json: { error: exception.message }, status: :not_found
    end

    def render_error_response(exception)
      render json: { message: exception.message, code: exception.code }, status: exception.http_status
    end

    def set_namespace_for_serializer
      self.namespace_for_serializer = Api
    end

    def pagination_meta(resource)
      {
        pagination:  {
          page: resource.current_page,
          per_page: resource.limit_value,
          total_pages: resource.total_pages,
          total_count: resource.total_count,
          next_page: resource.next_page,
          prev_page: resource.prev_page
        }
      }
    end
  end
end
