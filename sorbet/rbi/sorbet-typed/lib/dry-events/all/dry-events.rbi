# typed: strong
#
module Dry::Events
  class Publisher
    sig {params(id: Symbol).returns(Dry::Events::Publisher)}
    def self.[](id); end

    module ClassMethods
      sig{params(event_id: String, payload: T.untyped).void}
      def register_event(event_id, payload = {}); end
    end
  end
end
