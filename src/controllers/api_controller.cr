class ApiController < ApplicationController
  def auth
    hash = {"token" => ""}
    if User.valid_session?(params["username"], params["password"])
      digest = OpenSSL::Digest.new("sha256").update(params["password"]).to_s
      username = params["username"]
      hash["token"] = "#{username};#{digest}"
    else
      halt!(401, "Not authorized")
    end
    respond_with do
      json hash.to_json
    end
  end

  def info
    if u = User.valid_session?(params["username"], params["password"])
      hash = {success: true, user: u}
      respond_with do
        json hash.to_json
      end
    else
      halt!(401, "Not authorized")
    end
  end

  def register
    puts "here"
    u = User.new
    u.password_enc = params["password"]
    u.email = params["email"]
    u.name = params["name"]
    u.surname = params["surname"]
    u.username = params["username"]
    u.phone = params["phone"]

    chset = Repo.insert(u)
    if chset.valid?
      hash = {success: true, user: u}
      respond_with do
        json hash.to_json
      end
    else
      halt!(422, "Unprocessable entity")
    end
  end
end

