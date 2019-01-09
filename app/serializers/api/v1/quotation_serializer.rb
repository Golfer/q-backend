module Api
  module V1
    class QuotationSerializer < Api::ApplicationSerializer
      attributes :id, :body, :author_full_name
      has_many :tags, include: true
      has_one :author

      def author_full_name
        object&.author&.full_name
      end
    end
  end
end
