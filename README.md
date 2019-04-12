# Ruby on Rails development on Docker with Windows

## Clone this repository
Run the code below in your directory.
~~~
git clone https://github.com/KatsukiFujimoto/rails-dev-template.git
~~~

## Customize the repository as you want
If you want to rename the repository, run the code below
~~~
mv rails-dev-template [your app name]
cd rails-dev-template / [your app name]
~~~

If you want to change the env file, edit the file in containers directory as you want

## Prepare your docker container
Run the code below in your app directory
~~~
docker-compose run app bundle exec rails new . --force --database=mysql --skip-bundle
docker-compose build
~~~

## Apply env variables
config/database.yml
~~~
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV["DATABASE_USERNAME"] %>
  password: <%= ENV["DATABASE_PASSWORD"] %>
  host: <%= ENV["DATABASE_HOSTNAME"] %>
  
development:
  <<: *default
  database: <%= ENV["DATABASE_NAME"] %>

test:
  <<: *default
  database: <%= ENV["DATABASE_NAME"] %>
  
production:
  <<: *default
  database: <%= ENV["DATABASE_NAME"] %>
~~~

## Add FileUpdateChecker
config/environments/development.rb
~~~
  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
    config.file_watcher = ActiveSupport::FileUpdateChecker
~~~

## Start the docker container
Run the code below in your app directory
~~~
docker-compose up -d
~~~

## Start Ruby on Rails development
You're all set!! Now you can develop your app!!
