# typed: true
require "stripe"

module Resources
  Stripe.api_key = ENV["STRIPE_API_KEY"]

  def products
    Stripe::Product.list.data
  end
end
