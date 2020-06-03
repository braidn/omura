# frozen_string_literal: true
# typed: strong
#
class BasePublisher
  extend T::Sig

  sig { params(id: Symbol).returns(T::Boolean) }
  def publisher(id)
    true
  end
end
