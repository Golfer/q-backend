module Services
  module Goodread
    class Importer < Services::Base
      attr_reader :data

      attr_accessor :list_items, :result_list


      def initialize(**args)
        raise ArgumentError.new('GoodRead Service [data] must be exists') unless args[:data].present?
        @data = args[:data]
        @result_list = []
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
            record_author = create_author(item[:author][:full_name])
            record_quotation = create_quotation(item, record_author)
            record_tags = create_tags(item[:tags], record_quotation)

            result_list << {
              quotation: record_quotation&.body,
              author: record_author&.full_name,
              tags: record_tags&.pluck(:name)
            }
          end
          result_list
        end

        def create_quotation(item, author)
          body_quotation = item[:quotation]
          quotation_record = Quotation.find_by(body: body_quotation) || Quotation.new(body: body_quotation)
          quotation_record.author = author if author
          quotation_record.save
          quotation_record
        end

        def create_author(author)
          author = Author.where(full_name: author)&.first || Author.create(full_name: author)
          author
        end

        def create_tags(tags, quotation)
          tags.each do |tag|
            quotation.tags << Tag.find_or_create_by(name: tag)
          end
          quotation.tags
        end
    end
  end
end
