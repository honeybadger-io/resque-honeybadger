require "resque"
require "honeybadger"

module Resque
  module Failure
    class Honeybadger < Base
      def self.configure(&block)
        ::Honeybadger.configure(&block)
      end

      def count
        # We don't want to ask Honeybadger for the total # of errors,
        # so we fake it by asking Resque instead.
        Stat[:failed]
      end

      def save
        flush_if_v2 do
          ::Honeybadger.notify_or_ignore(exception,
            :parameters => {
              :payload_class => payload['class'].to_s,
              :payload_args => payload['args'].inspect
            }
          )
        end
      end

      private

      def flush_if_v2
        if ::Honeybadger.respond_to?(:flush)
          ::Honeybadger.flush { yield }
        else
          yield
        end
      end
    end
  end
end
