class Admin < Crecto::Model
  schema "admins" do
    field :name, String
    field :encrypted_password, String
    field :bot_key, String
  end
  validate_required [:encrypted_password, :bot_key]

  validates :name, 
    presence: true,
    length: {min: 2, max: 20}


  unique_constraint :name
  unique_constraint :bot_key

  def password=(password)
    self.encrypted_password = OpenSSL::Digest.new("sha256").update(password).to_s
  end

  def self.valid_session?(username, password)
    u = Repo.get_by(Admin, name: username)
    u.try do |admin|
      return admin.encrypted_password == OpenSSL::Digest.new("sha256").update(password).to_s
    end
    false
  end
end
