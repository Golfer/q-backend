require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'

require 'capistrano/puma'
require 'capistrano/rails/collection'
require 'capistrano/rake'

install_plugin Capistrano::Puma, load_hooks: false  # Default puma tasks without hooks
install_plugin Capistrano::Puma::Monit, load_hooks: false  # Monit tasks without hooks

set :rvm_type, :user
set :rvm_ruby_version, '2.5.3'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
