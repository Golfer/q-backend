if Rails.env.development?

  threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
  threads threads_count, threads_count

  port        ENV.fetch('PUMA_PORT') { 3000 }

  environment ENV.fetch('RAILS_ENV') { 'development' }

  plugin :tmp_restart
else
  # Change to match your CPU core count
  workers 1
  # Min and Max threads per worker
  threads 1, 6
  # Default to production
  app_dir = File.expand_path('../..', __FILE__)
  shared_dir = "#{app_dir}/shared"
  rails_env = ENV['RAILS_ENV'] || 'staging'

  environment rails_env
  # Set up socket location
  bind "unix://#{shared_dir}/sockets/puma.sock"
  # Logging
  stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

  # Set master PID and state locations
  pidfile "#{shared_dir}/pids/puma.pid"
  state_path "#{shared_dir}/pids/puma.state"
  activate_control_app
  on_worker_boot do
    require 'active_record'
    ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
    ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
  end
end




# workers Integer(ENV['WEB_CONCURRENCY'] || 2)
# threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
# threads threads_count, threads_count
#
# preload_app!
#
# rackup      DefaultRackup
# port        ENV['PORT']     || 3000
# environment ENV['RACK_ENV'] || 'development'
#
# on_worker_boot do
#   # Worker specific setup for Rails 4.1+
#   # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
#   ActiveRecord::Base.establish_connection
# end
#
# before_fork do
#   PumaWorkerKiller.config do |config|
#     config.ram           = 512 # mb
#     config.frequency     = 360 # seconds
#     config.percent_usage = 0.98
#     config.rolling_restart_frequency = 6 * 3600 # 6 hours in seconds
#   end
#   PumaWorkerKiller.start
# end
