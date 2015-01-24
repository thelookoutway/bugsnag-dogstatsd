# Bugsnag::Statsd

Bugsnag middleware that increments statsd counter on each exception.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bugsnag-statsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bugsnag-statsd

## Usage

Add the middleware when you configure Bugsnag.

    Bugsnag.configure do |config|
      config.middleware.use Bugsnag::Statsd::Builder.new(statsd: $statsd, tag: 'My Rails App')
    end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bugsnag-statsd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
