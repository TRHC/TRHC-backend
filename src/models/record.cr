class Record < Crecto::Model
  schema "records" do
    belongs_to :user, User
    field :amount, Float64
    field :unit, String
    field :period, String
    field :start_date, Time
  end
end
