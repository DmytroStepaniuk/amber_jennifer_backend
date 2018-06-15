require "./config/initializers/database.cr"

require "./db/migrations/*"

Jennifer::Config.read("./config/database.yml", :development )
Jennifer::Migration::Version.all

require "jennifer"
require "jennifer/adapter/postgres"
require "sam"

load_dependencies "jennifer"

# your another tasks here
Sam.help
