# frozen_string_literal: true
# typed: true
#
class Listener
  def call(event_name, data)
  end
end

class BasePublisher
  extend T::Sig

  LISTENERS = T.let(Set.new, T::Set[Listener])

  sig { params(id: Symbol).returns(T::Boolean) }
  def publisher(id)
    true
  end

  sig { params(event_name: T.any(String, Integer), data: T::Hash[T.untyped, T.untyped]).void }
  def publish_message(event_name, data)
    LISTENERS.each do |listener|
      listener.call(event_name, data)
    end
  end

  sig { params(listener: Listener).returns(T::Set[Listener]) }
  def register_listener(listener)
    LISTENERS << listener
  end
end
