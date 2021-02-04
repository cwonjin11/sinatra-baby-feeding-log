ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# configure :development do
#   set :database, 'sqlite3:db/database.db'
# end


  # Active Record is a Ruby gem, meaning we get an entire library of code just by running gem install activerecord or by including it in our Gemfile
  # Connect to DB
  # Once our Gem environment knows to put ActiveRecord into the picture, we need to tell ActiveRecord where the database is located that it will be working with.
  # We do this by running ActiveRecord::Base.establish_connection. Once establish_connection is run, ActiveRecord::Base keeps it stored as a class variable at ActiveRecord::Base.connection.
# We're using the establish_connection method from ActiveRecord::Base to connect to our artists database, which will be created in the migration via SQLite3 (the adapter).
  ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
