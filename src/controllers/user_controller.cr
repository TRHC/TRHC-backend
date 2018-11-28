class UserController < ApplicationController
  def register
    u = User.new
    u.password_enc = uparams["password"]
    u.email = uparams["email"]
    u.name = uparams["name"]
    u.surname = uparams["surname"]
    u.username = uparams["username"]
    u.phone = uparams["phone"]

    chset = Repo.insert(u)
    respond_with do
      json({
        success: chset.valid?, 
        user: u,
        errors: chset.errors
      }.to_json)
    end
  end

  def auth
    halt!(422, "Wrong credentials") unless User.valid_session?(params["username"], params["password"])
    
    digest = OpenSSL::Digest.new("sha256").update(params["password"]).to_s
    username = params["username"]
    respond_with do
      json({
        success: true, 
        token: "#{username};#{digest}"
      }.to_json)
    end
  end

  def info
    respond_with do
      json({
        success: true, 
        user: @u
      }.to_json)
    end
  end

  def uparams
    params.validation do
      required(:surname) {|v| !v.empty?}
      required(:username) {|v| !v.empty?}
      required(:phone) {|v| !v.empty?}
      required(:email) {|v| !v.empty?}
      required(:password) {|v| !v.empty?}
    end
  end
end