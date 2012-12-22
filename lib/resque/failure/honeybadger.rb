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
        ::Honeybadger.notify_or_ignore(exception,
          :parameters => {
            :payload_class => payload['class'].to_s,
            :payload_args => payload['args'].inspect
          }
        )
      end
    end
  end
end
