# frozen_string_literal: true

# typed: strict
require "stripe"

class Product < Stripe::StripeObject
  extend T::Sig

  sig { retunrs(String) }
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

class ProductRepository
  Stripe.api_key = ENV["STRIPE_API_KEY"]
  extend T::Sig

  def get(id)
    products.select { |product| product[:id] == id }.first.tap do |product|
      product[:_links] = {self: {href: "/products/#{product[:id]}"}}
    end
  end

  private

  sig { returns(T::Array[Product]) }
  def products
    Stripe::Product.list.data
  end
end
