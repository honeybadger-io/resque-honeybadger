module Resque
  module Failure
    # A Resque failure backend that sends exception data to honeybadger.io
    class Honeybadger < Base

      # Configures the failure backend. At a minimum you will need to set
      # an api_key.
      #
      # @example Setting your API Key and enabling SSL:
      #   Resque::Failure::Honeybadger.configure do |config|
      #     config.api_key = '505f2518c41866bb0be7ba434bb2b079'
      #   end
      def self.configure(&block)
        ::Honeybadger.configure(&block)
      end

      def count
        # We can't get the total # of errors from Hoptoad so we fake it
        # by asking Resque how many errors it has seen.
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
