require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

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
end
