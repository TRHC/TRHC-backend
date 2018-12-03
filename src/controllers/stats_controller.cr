class StatsController < ApplicationController
  DATES = ["month", "day", "hour"]

  def stats
    u = @u.as(User)
    halt!(422) if Record.empty_by(u)

    after_date  = date_params["after_date"]
    before_date = date_params["before_date"]
    period      = date_params["period"]

    last_date = Record.last_date(u)
    first_date = Record.first_date(u)

    qHour, qDay, qMonth = Record.counts(u)
    tHour, tDay, tMonth = Record.total(u)


    if after_date == "start" && before_date == "start"
      before_date = last_date.to_s
      after_date  = (last_date.as(Time) - 24.hours).to_s
      period = "hour"
    end


    pr = Record.filter_records(@u.as(User), "day", after_date, before_date)
    dates   = pr.map {|r| r.start_date.to_s}
    amounts = pr.map {|r| r.amount.as(Float64)}

    res = JSON.build do |json|
      json.object do
        json.field "data" do 
          json.object do
            json.field "dates", dates
            json.field "amounts", amounts
          end
        end

        json.field "range" do
          json.object do
            json.field "last_date", last_date
            json.field "first_date", first_date
          end
        end

        json.field "statistics" do
          json.object do
            json.field "avgHour", tHour / qHour
            json.field "avgDay", tDay / qDay
            json.field "avgMonth", tMonth / qMonth
            json.field "total", tDay
          end
        end
      end
    end
  end

  def upload
    content = params.files["csv"].file.gets_to_end
    @u.try do |u|
      Repo.delete_all(Record, Query.where(user_id: u.id))
      CSVJob.dispatch(content, u)
    end
  end

  def date_params
    params.validation do
      required(:before_date) {|v| !v.empty?}
      required(:after_date) {|v| !v.empty?}
      optional(:period) {|v| !v.empty?}
    end
  end
end