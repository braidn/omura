# frozen_string_literal: true
# typed: strong
#
class BasePublisher
  extend T::Sig

  LISTENERS = Set.new

  sig {params(id: Symbol).returns(T::Boolean)}
  def publisher(id)
    true
  end

  def publish(event_name, data)
    LISTENERS.each do |listener|
      listener.call(event_name, data)
    end
  end

  def register_event(listener)
    LISTENERS << listener
  end
end
