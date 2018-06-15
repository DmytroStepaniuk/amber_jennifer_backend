# require "granite_orm/adapter/pg"
require "jennifer"

require "jennifer/adapter/postgres"

require "colorize"

# Granite::ORM.settings.database_url = Amber.settings.database_url
# Granite::ORM.settings.logger = Amber.settings.logger.dup
# Granite::ORM.settings.logger.progname = "Granite"

# Todo pass env as symbol
Jennifer::Config.read("config/database.yml", :development)

Jennifer::Config.configure do |conf|
  conf.logger = Logger.new(STDOUT)

  conf.logger.formatter = Logger::Formatter.new do |severity, datetime, progname, message, io|
    io << datetime.colorize(:cyan) << ": " << message.gsub("\n", " ").colorize(:light_magenta)
  end

  conf.logger.level = Logger::DEBUG
end
