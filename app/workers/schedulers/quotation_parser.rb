require 'sidekiq-scheduler'
module Schedulers
  class QuotationParser
    include Sidekiq::Worker

    attr_accessor :pending_jobs

    def perform
      logger.info 'Do not have any pending Job' unless pending_jobs.any?
      pending_jobs[0..1].each do |current_job|
        tags = current_job.data['tags'].strip.split(',') || []
        start_page = current_job.data['page'] || 1
        only_current_page = true # current_job.data['only_current_page'] || true
        next unless tags.length > 0
        JobRun.transaction do
          current_job.run
          current_job.save!
          tags.each do |tag|
            "Services::#{current_job.name}".constantize.new(
              tag: tag.strip,
              start_page: start_page,
              only_current_page: only_current_page
            ).call
          end
          current_job.done
          current_job.save!
        end
      end
    end

    private
      def pending_jobs
        @pending_jobs ||= JobRun.job_init
      end
  end
end
