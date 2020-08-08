require_relative("./app")

unless ENV["RACK_ENV"] == "development"
  App.freeze
end

run(App.app)
