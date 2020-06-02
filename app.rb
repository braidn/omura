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
        publisher = ProductPublisher.new
        repo = ProductRepository.new

        product = repo.get(params[:id])
        publisher.publish('product.requested', id: params[:id]) if product

        json(product, 'application/hal+json')
      end

      post '/products' do
        publisher = ProductPublisher.new
        id = ULID.generate
        publisher.publish('product.created', product: params.merge(id: id))

        status(201)
        headers['Location'] = "/api/v1/product/#{id}"
        json(params, 'application/hal+json')
      end
    end
  end
end
