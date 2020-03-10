# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/api'

class App < Hanami::API
  get '/' do
    200
  end
end
