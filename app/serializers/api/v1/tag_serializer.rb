module Api
  module V1
    class TagSerializer < Api::ApplicationSerializer
      attributes :id, :name
    end
  end
end
