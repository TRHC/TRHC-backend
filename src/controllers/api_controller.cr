class ApiController < ApplicationController
  before_action do 
    only [:upload, :info, :stats] do 
      u = User.valid_session?(request.headers["Authorization"])
      if u
        @u = u.as(User)
      else
        halt!(401)
      end
    rescue
      halt!(401)
    end
  end

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
    hash = {success: true, user: @u}
    respond_with do
      json hash.to_json
    end
  end

  def stats
    hash = {} of String => Array(Record) | Record | Bool
    ["month", "day", "hour"].each do |period|
      hash[period] = Repo.all(Record, Query.where(period: period, user_id: @u.as(User).id))
    end
    respond_with do 
      json hash.to_json
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

  def upload
    content = params.files["csv"].file.gets_to_end
    CSVJob.dispatch(content, @u)
  end
end

