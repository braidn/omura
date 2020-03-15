# typed: true
ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, :test

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/minitest'
require 'rack/mock'

require_relative '../app'
Dir[File.join(__dir__, '..', 'publishers', '*.rb')].each { |file| require file }

class RequestTest < Minitest::Spec
  def app
    Rack::MockRequest.new(App.new)
  end
end

class UnitTest < Minitest::Spec
end
