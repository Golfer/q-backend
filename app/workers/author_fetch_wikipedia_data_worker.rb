class AuthorFetchWikipediaDataWorker
  include Sidekiq::Worker

  def perform(*args)
    Rails.logger.info 'Run Fetcher WikipediaData Worker for Author'
  end
end
