namespace :fetcher do
  desc 'Fetch Q from GB'
  task run: :environment do
    unless ENV['TAGS'].blank?
      tags = ENV['TAGS']&.strip&.split(',')
      start_page = ENV['START_PAGE'].present? ? ENV['START_PAGE'].to_i : 1
      only_current_page = ENV['ONLY_CURRENT_PAGE'].present? && ENV['ONLY_CURRENT_PAGE'] == 'false' ? false :  true
      start_time = Time.zone.now
      puts 'Fetcher: RUN'
      if tags.count > 0
        tags.each do |tag|
          puts "Fetch TAG: #{tag}; /\ With Params[START_PAGE:-> #{start_page} /\ ONLY_CURRENT_PAGE:->  #{only_current_page}]"
          Services::Goodread::Fetcher.new(tag: tag.strip, start_page: start_page, only_current_page: only_current_page).call
        end
      end
      puts 'Fetcher: Importing: DONE'
      finish_time = Time.zone.now
      log_data(start_time..finish_time)
    end
  end
end


def log_data(data_range)

  count_quotations = Quotation.where(created_at: data_range).count
  count_authors = Author.where(created_at: data_range).count
  count_tags = Tag.where(created_at: data_range).count

  puts "HAS BEEN Fetched: /\
        Quotations: #{count_quotations} /\
        Authors: #{count_authors} /\
        Tags: #{count_tags}"

  logger.info "HAS BEEN Fetched: /\
            Quotations: #{count_quotations} /\
            Authors: #{count_authors} /\
            Tags: #{count_tags}"
end

def logger
  Logger.new(Rails.root.join('log/fetcher.log'))
end