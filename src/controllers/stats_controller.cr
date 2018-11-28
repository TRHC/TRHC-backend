class StatsController < ApplicationController
  DATES = ["month", "day", "hour"]

  def stats
    hash = {} of String => Array(String) | Array(Array(Float64) | Array(String)) | Array(String) | Record | Bool
    after_date  = date_params["after_date"]
    before_date = date_params["before_date"]

    DATES.each do |period|
      pr = Record.filter_records(@u.as(User), period, after_date, before_date)
      dates   = pr.map {|r| r.start_date.to_s}
      amounts = pr.map {|r| r.amount.as(Float64)}
      hash[period] = [amounts, dates]
    end
        
    respond_with do 
      json hash.to_json
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
    end
  end
end