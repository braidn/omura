# frozen_string_literal: true
#
# typed: true

require "rack"
require 'sorbet-runtime'

class BodyParamsContract
  extend T::Sig
  MissingParams = Struct.new(:errors)

  sig { params(params: T.untyped).returns(BodyParamsContract::MissingParams) }
  def call(params)
    params.include?("_links") ? links_present : links_missing
  end

  private

  sig { returns(BodyParamsContract::MissingParams) }
  def links_missing
    MissingParams.new(["Missing required _links object"])
  end

  sig { returns(BodyParamsContract::MissingParams) }
  def links_present
    MissingParams.new([])
  end
end

class BodyParamsValidator
  extend T::Sig
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    return @app.call(env) unless req.post? || req.patch? || req.put?

    check = links_present?(req.params)

    return bad_request if check.errors.any?

    @app.call(env)
  end

  private

  sig { params(params: T.untyped).returns(BodyParamsContract::MissingParams) }
  def links_present?(params)
    links_contract.call(params)
  end

  sig { returns(BodyParamsContract) }
  def links_contract
    BodyParamsContract.new
  end

  sig { returns(T::Array[T.any(T::Hash[String, String], Integer)]) }
  def bad_request
    [400, {"Content-Type" => "application/hal+json"}, {}]
  end
end

