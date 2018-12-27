module Services
  module Brainy
    class FetchData < Services::Base
      SITE_URL = 'https://www.brainyquote.com/'.freeze

      attr_reader :page_link

      attr_accessor :link_to_request, :request_data, :response_data

      def initialize(**args)
        raise ArgumentError.new('Brainy Service [page_link] must be exists') unless args[:bage_link].present?
        @page_link = args[:page_link]
        @link_to_request = SITE_URL + page_link
      end

      def call; end

      private

        def quotations
          @quotations = response_data.css('div#quotesList').css('div')
        end

        def request_data
          @request_data = RestClient.get(link_to_request)
        end

        def response_data
          @response_data = Nokogiri::XML(request_data.body)
        end
    end
  end
end
