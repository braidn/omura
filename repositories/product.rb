# frozen_string_literal: true

# typed: strict
require "stripe"
require 'sorbet-runtime'

class ProductLinks < T::Struct
  extend T::Sig
  const :id, String

  sig {returns(T::Hash[Symbol, T::Hash[Symbol, String]])}
  def links
    {self: {href: "/products/#{id}"}}
  end
end

class ProductRepository
  Stripe.api_key = ENV.fetch("STRIPE_API_KEY", "")
  extend T::Sig

  def get(id)
    product = products.select { |product| product.id.eql?(id) }.first

    product.to_hash.merge(ProductLinks.new(id: product.id).links)
  end

  private

  sig{ returns T::Array[T.untyped]}
  def products
    Stripe::Product.list.data
  end
end
