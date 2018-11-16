require "dispatch"

Dispatch.configure do |config|
  config.num_workers = 5
  config.queue_size = 10
  config.logger = Amber.settings.logger.dup
end

class CSVJob
  include Dispatchable

  def perform(content, user)
    csv = SolStat::Parser::SCSV.new(content)
    csv.parse_headers
    m = Crecto::Multi.new
    csv.each_row do |row|
      r = Record.new
      r.unit = row[:unit]
      r.period = row[:period]
      r.amount = row[:value]
      r.start_date = row[:start_time]
      r.user = user
      m.insert(r)
    end
    Repo.transaction(m)
  end
end
