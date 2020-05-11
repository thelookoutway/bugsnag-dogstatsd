require_relative "dogstatsd/version"

module Bugsnag
  module DogStatsd
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
      end

      def call(report)
        @statsd.increment('ruby.exception', tags: ["severity:#{report.severity}"])
        @bugsnag.call(report)
      end
    end
  end
end
