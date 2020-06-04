# typed: false
# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/api'
require 'ulid'
require_relative './middlewares/body_params_validator'

class App < Hanami::API
  get '/' do
    200
  end

  scope 'api' do
    use BodyParamsValidator
    scope 'v1' do
      get '/product/:id' do
        repo = ProductRepository.new
        product = repo.get(params[:id])

        json(product, 'application/hal+json')
      end

      post '/products' do
        id = ULID.generate

        status(201)
        headers['Location'] = "/api/v1/product/#{id}"
        json(params, 'application/hal+json')
      end
    end
  end
end
