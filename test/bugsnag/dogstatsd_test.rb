require_relative "../../lib/bugsnag/dogstatsd"
require "minitest/autorun"
require "bugsnag"
require "datadog/statsd"

class Bugsnag::DogStatsdTest < Minitest::Test
  class FakeUDPSocket # See https://github.com/DataDog/dogstatsd-ruby/blob/master/spec/support/fake_udp_socket.rb
    def initialize
      @buffer = []
      @error_on_send = nil
    end

    def send(message, *)
      raise @error_on_send if @error_on_send
      @buffer.push [message]
    end

    def recv
      @buffer.shift
    end

    def to_s
      inspect
    end

    def inspect
      "<FakeUDPSocket: #{@buffer.inspect}>"
    end

    def error_on_send(err)
      @error_on_send = err
    end

    def connect(*args)
    end

    def close
    end
  end

  def generate_valid_bugsnag_api_key
    (0..32).map { "a" }.join
  end

  def test_middleware
    socket = FakeUDPSocket.new
    statsd = Datadog::Statsd.new
    statsd.connection.instance_variable_set(:@socket, socket)

    Bugsnag.configure do |config|
      config.api_key = generate_valid_bugsnag_api_key
      config.delivery_method = :synchronous
      config.release_stage = "production"
      config.middleware.use Bugsnag::DogStatsd::Builder.new(statsd: statsd)
    end
    Bugsnag.notify(StandardError.new)

    assert_equal ["ruby.exception:1|c|#severity:warning"], socket.recv
  end
end
