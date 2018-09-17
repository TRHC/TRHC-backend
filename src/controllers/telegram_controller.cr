class TelegramController < ApplicationController
  def updates
    BhotaBot::BOT.handle_update(TelegramBot::Update.from_json(request.body.not_nil!))
    respond_with {
      json "{\"status\": \"ok\"}"
    }
  end
end
