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
  end
end
