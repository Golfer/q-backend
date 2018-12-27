module Api
  module V1
    class AuthorSerializer < Api::ApplicationSerializer
      attributes :id, :full_name
    end
  end
end
