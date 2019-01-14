# README
Install dependencies
````
bundle
````

Setup DB
````
rake db:create db:migrate
````

run Sidekiq
````
bundle exec sidekiq
````