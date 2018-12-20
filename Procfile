Redis_Server: redis-server
WORKER: bundle exec sidekiq -c 2 -L log/sidekiq.log
WEB:           bundle exec puma -C config/puma.rb
LOG: tail -f log/development.log