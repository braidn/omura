# frozen_string_literal: true

# typed: strict
require "stripe"

class ProductRepository
  Stripe.api_key = ENV["STRIPE_API_KEY"]
  extend T::Sig

  sig { params(id: String).returns(Stripe::Product) }
  def get(id)
    products.select { |product| product[:id] == id }.first.tap do |product|
      product[:_links] = {self: {href: "/products/#{product[:id]}"}}
    end
  end

  private

  def products
    Stripe::Product.list.data
  end
end
