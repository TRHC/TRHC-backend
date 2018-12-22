Amber::Server.configure do
  pipeline :web do
    plug Amber::Pipe::PoweredByAmber.new
    plug Citrine::I18n::Handler.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
  end

  pipeline :api do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    hosts = [] of String | Regex
    hosts.push("*")
    headers = %w(Accept Origin Connection Content-Type Authorization DNT User-Agent Referer Accept-Encoding Access-Control-Request-Origin Accept-Language Cookie)
    plug Amber::Pipe::CORS.new(origins: hosts, methods: %w(GET POST PUT PATCH DELETE), headers: headers)
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web, "/web" do
  end

  routes :api, "/api" do
    post "/auth",     UserController, :auth
    post "/register", UserController, :register
    get  "/info",     UserController, :info

    get   "/stats",   StatsController, :stats
    get "/collect", StatsController, :collect

    post "/new",     DeviceController, :new
    post "/delete_device", DeviceController, :delete_device
    get  "/devices", DeviceController, :devices
  end

  routes :static do
    get "/*", Amber::Controller::Static, :index
  end
end
