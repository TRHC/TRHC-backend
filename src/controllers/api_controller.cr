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

  def get_me
    json = BhotaBot::BOT.get_me
    respond_with do 
      json json.to_json
    end
  end

  def get_chats
    chats = TBot::User.get_chats.map do |chat_id|
      chat_id.try do |id|
        BhotaBot::BOT.get_chat(id)
      end
    end
    json = {"chats" => chats}.to_json
    respond_with do 
      json json
    end
  end

  def send_msg
    msg = params["text"]
    chat_id = params["chat_id"]
    json = BhotaBot::BOT.send_message(chat_id, msg)
    h = {"success" => true, "res" => json}.to_json
    respond_with do 
      json h
    end
  end
end
