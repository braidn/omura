# frozen_string_literal: true
# typed: strong
require 'dry/events/publisher'

class ProductPublisher
  include Dry::Events::Publisher[:product_publisher]

  register_event('product.created')
end
