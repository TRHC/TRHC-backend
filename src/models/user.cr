class User < Crecto::Model
  schema "users" do
    field :name, String
    field :surname, String
    field :username, String
    field :phone, String
    field :email, String
    field :password, String
  end

  validate_required [:name, :surname, :username, :phone, :email, :password]

  validates [:name, :surname, :username, :email], 
    presence: true,
    length: {min: 2, max: 35}

  validate_format :email, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  unique_constraint [:username, :phone, :email]

  def password_enc=(password)
    self.password = OpenSSL::Digest.new("sha256").update(password).to_s
  end

  def self.valid_session?(username, password)
    u = Repo.get_by(User, username: username)
    u.try do |user|
      return user if user.password == OpenSSL::Digest.new("sha256").update(password).to_s
    end
    false
  end

  def self.valid_session?(token)
    username, hash = token.split(";")
    u = Repo.get_by(User, username: username)
    u.try do |user|
      return user if user.password == hash
    end
    false
  end
end

