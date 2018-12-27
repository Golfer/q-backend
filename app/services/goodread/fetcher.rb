module Services
  module Goodread
    class Fetcher < Services::Base
      SITE_URL = 'https://www.goodreads.com'.freeze

      attr_reader :tag, :only_current_page, :start_page

      attr_accessor :link_to_request, :request_data, :response_data, :quotations, :current_quotation, :quotation_quote, :quotation_author, :quotation_quote, :count_of_likes, :quotation_tags, :result_data, :next_link


      def initialize(**args)
        raise ArgumentError.new('GoodRead Service [tag] must be exists') unless args[:tag].present?
        @start_page = args[:start_page] || 1
        @only_current_page = args[:only_current_page] || false
        @result_data = []
        @tag = args[:tag]
        @link_to_request = args[:link_to_request] || "#{SITE_URL}/quotes/tag/#{tag}?page=#{start_page}"
      end

      def call
        grab_data_page

        grab_data = { items: result_data, next_page: next_link, tag: tag }

        Services::Goodread::Importer.new(data: grab_data).call
        unless only_current_page || next_link.nil?
          wait_time = Random.rand(3..10)
          Rails.logger.info "Wait #{wait_time} seconds"
          sleep wait_time
          Services::Goodread::Fetcher.new(tag: tag, link_to_request: SITE_URL + next_link).call
        end
      end

      private

        def grab_data_page
          Rails.logger.info "GRUB PAGE: #{link_to_request}"
          quotations.each do |quotation|
            @current_quotation = quotation
            @result_data << { quotation: quotation_quote, author: quotation_author, tags: quotation_tags, count_of_likes: count_of_likes
            }
          end
        end

        def next_link
          return nil if response_data.css('div.leftContainer').css('a.next_page').empty?
          @next_link = response_data.css('div.leftContainer').css('a.next_page')&.attr('href')&.text
        end

        def quotations
          @quotations = response_data.css('div.leftContainer').css('div.quote')
        end

        def quotation_tags
          list_of_tags = []
          items = current_quotation.css('.left').css('a')
          items.each { |el| list_of_tags << el&.text&.strip }
          list_of_tags
        end

        def quotation_quote
          @quotation_quote = current_quotation&.at('.quoteText')&.children&.first&.text&.strip
        end

        def quotation_author
          link_description = current_quotation&.at('.leftAlignedImage')&.attr('href')
          full_name = current_quotation&.at('.leftAlignedImage img')&.attr('alt')
          img_link = current_quotation&.at('.leftAlignedImage img')&.attr('src')

          @quotation_author = { full_name: full_name, link: link_description, img_link: img_link
          }
        end

        def count_of_likes
          @count_of_likes = current_quotation.css('.right').css('a').text.to_i
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
