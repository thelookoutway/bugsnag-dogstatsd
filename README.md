# Bugsnag::DogStatsd

Bugsnag middleware that increments a Datadog flavoured Statsd counter for each exception.

## Installation

First, this line to your application's Gemfile:

    gem 'bugsnag-dogstatsd'

Then, install your application's dependencies:

    $ bundle

Then, add the bugsnag-dogtatsd middleware when you configure Bugsnag:

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::DogStatsd::Builder.new(statsd: $statsd)
    end

Finally, when Bugsnag is notified of an exception your Statsd counter will be incremented:

    "ruby.exception:1|c|#severity:warning"

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake test` to run the tests.

## Contributing

1. Fork it (https://github.com/fivegoodfriends/bugsnag-dogstatsd/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the MIT License. See LICENSE.txt.
