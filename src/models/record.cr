class Record < Crecto::Model
  schema "records" do
    belongs_to :user, User
    field :amount, Float64
    field :unit, String
    field :period, String
    field :start_date, Time
  end

  def self.filter_records(user : User, period : String, after_date : String, before_date : String)
    Repo.all(Record, 
        Query.where(
          period: period, 
          user_id: user.id
          ).where(
            "records.start_date > ?", after_date
          ).where(
            "records.start_date < ?", before_date
          )
      )
  end 

  def self.last_date(user : User)
    Repo.all(Record, 
      Query.select(["start_date"]
      ).where(user_id: user.id
      ).order_by("start_date DESC"
      ).limit(1)
    )[0].start_date
  end

  def self.first_date(user : User)
    Repo.all(Record, 
      Query.select(["start_date"]
      ).where(user_id: user.id
      ).order_by("start_date ASC"
      ).limit(1)
    )[0].start_date
  end

  def self.empty_by(u : User)
    Repo.all(Record, Query.where(user_id: u.id)).empty?
  end

  def self.total(u : User)
    ["hour", "day", "month"].map do |period| 
      Repo.aggregate(Record, :sum, :amount, Query.where(period: period, user_id: u.id)).to_s.to_f
    end
  end

  def self.counts(u : User)
    ["hour", "day", "month"].map do |period| 
      Repo.aggregate(Record, :count, :id, Query.where(period: period, user_id: u.id)).to_s.to_i
    end
  end
end
