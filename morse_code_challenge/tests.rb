#!/usr/bin/env ruby

gem 'test-unit'
require 'test/unit'
require 'test/unit/ui/console/testrunner'
require_relative 'encoder'

# Encoder tests

class EncoderEncodeMessageTest < Test::Unit::TestCase
  def test_encode_message
    encoder = Encoder.new('Good morning')
    result = encoder.encode_message
    assert_equal result, "--.|---|---|-../--|---|.-.|-.|..|-.|--."
  end

  def test_encode_message_with_invalid_characters
    encoder = Encoder.new('Good morning!*!')
    result = encoder.encode_message
    assert_equal result, "--.|---|---|-../--|---|.-.|-.|..|-.|--.|*|*|*"
  end
end