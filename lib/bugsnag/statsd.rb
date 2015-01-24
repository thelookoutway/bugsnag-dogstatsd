require "bugsnag/statsd/version"

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
        @statsd = options.fetch(:statsd)
        @tag = options.fetch(:tag)
      end

      def call(notification)
        @bugsnag.call(notification)
        @statsd.increment('ruby.exception', tags: [@tag])
      end
    end
  end
end
