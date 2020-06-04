# frozen_string_literal: true

# typed: strong

require_relative './base_publisher'

class ProductPublisher < BasePublisher
  sig { void }
  def initialize
    publisher(:product_publisher)
  end
end
