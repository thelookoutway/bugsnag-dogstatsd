require "bugsnag/statsd/version"
require "statsd"
require "uri"

module Bugsnag
  module Statsd
    class Builder
      def initialize(options)
        @options = options
      end

      def new(bugsnag)
        Middleware.new(bugsnag, @options)
      end
    end

    class Middleware
      def initialize(bugsnag, options)
        @bugsnag = bugsnag
        @statsd = options[:statsd] || new_statsd
        @tag = options.fetch(:tag)
      end

      def call(notification)
        @bugsnag.call(notification)
        @statsd.increment('ruby.exception', tags: [@tag])
      end

      private

      def new_statsd
        uri = URI.parse(ENV['STATSD_URL'] || "statsd://#{::Statsd::DEFAULT_HOST}:#{::Statsd::DEFAULT_PORT}")
        ::Statsd.new(uri.host, uri.port)
      end
    end
  end
end
