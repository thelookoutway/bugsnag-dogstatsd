# Bugsnag::Statsd

Bugsnag middleware that increments a Statsd counter for each exception.

## Installation

First, this line to your application's Gemfile

    gem 'bugsnag-statsd'

Then, execute

    $ bundle

Finally, add the middleware when you configure Bugsnag.

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::Statsd::Builder.new(tag: 'My App')
    end

## Configuration

Without any configuration the Statsd client will connect to the default
Statsd host and port.

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::Statsd::Builder.new(tag: 'My App')
    end

The `STATSD_URL` environment variable will be used if it is present.

    # Boot app with environment variable present.
    # Eg: `ENV["STATSD_URL"] = "localhost:9000"`

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::Statsd::Builder.new(tag: 'My App')
    end

Last, a Statsd client can be passed to the builder.

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::Statsd::Builder.new(statsd: $my_statsd_client, tag: 'My App')
    end

## Contributing

1. Fork it (https://github.com/tatey/bugsnag-statsd/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
