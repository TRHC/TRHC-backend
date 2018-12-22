class Device < Crecto::Model
  schema "devices" do
    belongs_to :user, User
    has_many :records, Record, dependent: :destroy
    field :uuid, String
    field :name, String
  end

  unique_constraint [:uuid, :name]
  validate_required [:uuid, :name]
end
