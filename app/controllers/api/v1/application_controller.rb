class Api::V1::ApplicationController < Api::ApplicationController
  def set_namespace_for_serializer
    self.namespace_for_serializer = Api::V1
  end
end
