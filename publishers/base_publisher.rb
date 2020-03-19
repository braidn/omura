# frozen_string_literal: true
# typed: strong
#
require 'dry/events/publisher'

class BasePublisher
  extend T::Sig
  extend Dry::Events::Publisher::ClassMethods
  include Dry::Events
  include Dry::Events::Publisher::InstanceMethods

  sig {params(id: Symbol).returns(Dry::Events::Publisher)}
  def publisher(id)
    ::Dry::Events::Publisher[id]
  end
end
