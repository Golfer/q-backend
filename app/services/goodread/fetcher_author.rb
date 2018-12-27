module Services
  module Goodread
    class FetcherAuthor < Services::Base
      SITE_URL = 'https://www.goodreads.com'.freeze

      attr_accessor :link_to_request, :request_data, :response_data, :link_author_detail

      def initialize(**args)
        raise ArgumentError.new('GoodRead Service [link_author_detail] must be exists') unless   args[:link_author_detail].present?
        @result_data = []
        @link_author_detail = args[:link_author_detail]
        @link_to_request = "#{SITE_URL}/link_author_detail"
      end

      def call
        grab_data
      end

      private

        def grab_data_page
          Rails.logger.info "GRUB PAGE: #{link_to_request}"

          {
            born: '',
            died: '',
            website: '',
            genre: [],
            influences: [],
            wikipedia_link: '',
            description: '',
            twitter: ''
          }
        end

        def quotation_author
          link_description = current_quotation&.at('.leftAlignedImage')&.attr('href')
          full_name = current_quotation&.at('.leftAlignedImage img')&.attr('alt')
          img_link = current_quotation&.at('.leftAlignedImage img')&.attr('src')

          @quotation_author = {
            full_name: full_name,
            link: link_description,
            img_link: img_link
          }
        end

        def request_data
          @request_data = RestClient.get(link_to_request)
        end

        def response_data
          @response_data = Nokogiri::HTML(request_data.body)
        end
    end
  end
end
