# typed: true
ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, :test

require 'minitest/autorun'
require 'minitest/spec'
require 'rack/mock'

require_relative '../app'

class RequestTest < Minitest::Spec
  def app
    Rack::MockRequest.new(App.new)
  end
end
