# frozen_string_literal: true

# typed: strict
require "stripe"
require 'sorbet-runtime'

class Product < Stripe::StripeObject
  extend T::Sig

  sig { returns(String) }
  def id
  end

  sig { returns(String) }
  def name
  end

  sig { returns(T::Boolean) }
  def active
  end

  sig { returns(T::Hash(Symbol, String)) }
  def _links
  end
end

class ProductLinks < T::Struct
  const :id, String

  def links
    {self: {href: "/products/#{id}"}}
  end
end

class ProductRepository
  Stripe.api_key = ENV["STRIPE_API_KEY"]
  extend T::Sig

  sig { params(id: String).returns(Product) }
  def get(id)
    product = products.select { |product| product.id.eql?(id) }.first
    Product.construct_from(product.to_hash.merge(ProductLinks.new(id: product.id).links))
  end

  private

  def products
    Stripe::Product.list.data
  end
end
