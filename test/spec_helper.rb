# typed: ignore
ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, :test

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/minitest'
require 'rack/mock'
require 'rack/test'

Dir[File.join(__dir__, '..', 'publishers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '..', 'repositories', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'support', 'schemas', '*.rb')].each do |file|
  require file
end

APP_STACK =
  Rack::Builder.parse_file(File.join(__dir__, '..', 'config.ru')).first

class RequestTest < Minitest::Spec
  include Rack::Test::Methods

  def app
    APP_STACK
  end
end

class UnitTest < Minitest::Spec; end
