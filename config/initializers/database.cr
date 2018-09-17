require "sqlite3"
require "crecto"

Query = Crecto::Repo::Query
Multi = Crecto::Repo::Multi

module Repo
  extend Crecto::Repo

  config do |c|
    c.adapter = Crecto::Adapters::SQLite3

    c.uri = Amber.settings.database_url
  end
end

Crecto::DbLogger.set_handler(Amber.settings.logger.dup)
