class ApiController < ApplicationController
  def auth
    hash = {"token" => ""}
    if Admin.valid_session?(params["username"], params["password"])
      digest = OpenSSL::Digest.new("sha256").update(params["password"]).to_s
      username = params["username"]
      hash["token"] = "#{username};#{digest}"
    else
      halt!(403, "Not authorized")
    end
    respond_with do
      json hash.to_json
    end
  end
end
