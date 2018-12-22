class StatsController < ApplicationController
  def stats
    u = @u.as(User)
    d = Repo.get_by!(Device, uuid: params[:uuid]).as(Device)
    s = Repo.all(Record, Query.where(device_id: d.id))

    halt!(422) if Record.empty_by(d)

    last_date = Record.last_date(d)
    first_date = Record.first_date(d)

    rhs = s.map {|r| r.rh}
    tcs = s.map {|r| r.tc}
    lbl = s.map {|r| r.created_at.to_s }


    q = Record.counts(d)

    res = JSON.build do |json|
      json.object do
        json.field "count", q
        json.field "range" do
          json.object do
            json.field "last_date", last_date
            json.field "first_date", first_date
          end
        end
        json.field "data" do 
          json.object do
            json.field "tcs", tcs
            json.field "rhs", rhs
            json.field "lbl", lbl
          end
        end
      end
    end
  end

  def collect
    rh   = params[:rh].to_f64
    tc   = params[:tc].to_f64
    uuid = params[:uuid]

    d = Repo.get_by!(Device, uuid: uuid)

    r = Record.new
    r.tc = tc
    r.rh = rh
    r.device_id = d.id
    Repo.insert(r)

    respond_with do
      json(r.to_json)
    end
  end
end