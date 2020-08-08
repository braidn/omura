# typed: false
# frozen_string_literal: true

require 'bundler/setup'
require 'roda'
require 'ulid'
require_relative './middlewares/body_params_validator'

class App < Roda
  route do |r|
    r.root do
      200
    end

    r.on 'api' do
      r.run BodyParamsValidator
      r.on scope 'v1' do
        r.get 'product/:id' do
          repo = ProductRepository.new
          product = repo.get(params[:id])

          json(product, 'application/hal+json')
        end

        r.post 'products' do
          id = ULID.generate

          status(201)
          headers['Location'] = "/api/v1/product/#{id}"
          json(params, 'application/hal+json')
        end
      end
    end
  end
end
