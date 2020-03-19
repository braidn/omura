# typed: false
# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/api'

class App < Hanami::API
  get '/' do
    200
  end

  scope 'api' do
    scope 'v1' do
      post '/products' do
        publisher = ProductPublisher.new
        publisher.publish('product.created', product: params)

        status(201)
        json(params, 'application/hal+json')
      end
    end
  end
end
