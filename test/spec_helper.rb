# typed: ignore

ENV["RACK_ENV"] = "test"

require "bundler"

Bundler.require :default, :test

require "minitest/autorun"
require "minitest/spec"
require "rack/mock"
require "rack/test"
require "webmock/minitest"

Dir[File.join(__dir__, "..", "publishers", "*.rb")].each { |file| require file }
Dir[File.join(__dir__, "..", "repositories", "*.rb")].each { |file| require file }

APP_STACK = Rack::Builder.parse_file(File.join(__dir__, "..", "config.ru")).first

WebMock.disable_net_connect!(allow: "#{ENV['STRIPE_URL']}:12111")

class RequestTest < Minitest::Spec
  include Rack::Test::Methods

  def app
    APP_STACK
  end

  def setup
    Stripe.api_key = 'sk_test_123'
    Stripe.api_version = "2020-08-27"
    Stripe.api_base = "http://#{ENV['STRIPE_URL']}:12111"
  end
end

class UnitTest < Minitest::Spec; end
