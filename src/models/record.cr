class Record < Crecto::Model
  schema "records" do
    belongs_to :device, Device
    field :rh, Float64
    field :tc, Float64
  end

  validates [:rh, :tc],
    presence: true

  def self.filter_records(device : Device, after_date : String, before_date : String)
    Repo.all(Record, 
        Query.where(
          device_id: device.id
          ).where(
            "records.created_at > ?", after_date
          ).where(
            "records.created_at < ?", before_date
          )
      )
  end 

  def self.last_date(device : Device)
    Repo.all(Record, 
      Query.select(["created_at"]
      ).where(device_id: device.id
      ).order_by("created_at DESC"
      ).limit(1)
    )[0].created_at
  end

  def self.first_date(device : Device)
    Repo.all(Record, 
      Query.select(["created_at"]
      ).where(device_id: device.id
      ).order_by("created_at ASC"
      ).limit(1)
    )[0].created_at
  end

  def self.empty_by(u : Device)
    Repo.all(Record, Query.where(device_id: u.id)).empty?
  end
  
  def self.counts(u : Device)
    Repo.aggregate(Record, :count, :id, Query.where(device_id: u.id)).to_s.to_i
  end
end
