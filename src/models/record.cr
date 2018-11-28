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
end
