module Resque
  module Failure
    class Honeybadger < Base
      # Configures the failure backend. At a minimum you will need to set
      # an api_key.
      #
      # @example Setting your API Key and enabling SSL:
      #   Resque::Failure::Honeybadger.configure do |config|
      #     config.api_key = '505f2518c41866bb0be7ba434bb2b079'
      #   end
      #
      # If you already configured Honeybadger for your app, x§
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
