# typed: false
# frozen_string_literal: true

require "bundler/setup"
require "roda"
require "ulid"

require_relative("./middlewares/body_params_validator")

class App < Roda
  use BodyParamsValidator

  route do |r|
    r.root do
      r.redirect "/status"
    end

    r.get("/status") do
      {status: "alive"}
    end

    r.on("api") do
      r.on("v1") do
        r.on("product", String) do |product_id|
          repo = ProductRepository.new
          product = repo.get(product_id)
          response["Content-Type"] = "application/hal+json"

          product.to_json
        end

        r.post("products") do
          response["Content-Type"] = "application/hal+json"
          response.status = 201

          id = ULID.generate
          response["Location"] = "/api/v1/product/#{id}"

          r.params.to_json
        end
      end
    end
  end
end
