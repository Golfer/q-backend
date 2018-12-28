module Services
  module Goodread
    class Importer < Services::Base
      attr_reader :data

      attr_accessor :list_items, :result_list


      def initialize(**args)
        raise ArgumentError.new('GoodRead Service [data] must be exists') unless args[:data].present?
        @data = args[:data]
      end

      def call
        return nil if data[:items].empty?
        create_objects
      end

      private

        def list_items
          @list_items = data[:items]
        end

        def create_objects
          list_items.map do |item|
            record_author = AuthorsInteractor::Create.call(author: item[:author])
            record_quotation = QuotationsInteractor::Create.call(quotation_body: item[:quotation], author: record_author.author, params: {})
            TagsInteractor::Create.call(tags: item[:tags], quotation: record_quotation.quotation)
          end
        end
    end
  end
end
