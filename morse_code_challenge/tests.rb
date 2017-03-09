#!/usr/bin/env ruby

gem 'test-unit'
require 'test/unit'
require 'test/unit/ui/console/testrunner'
require_relative 'encoder'
require_relative 'parser'

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

# Parser tests

class ParserParseTest < Test::Unit::TestCase
  def test_parse_for_string
    parser = Parser.new(['An awesome string'])
    result = parser.parse
    assert_equal result, 'An awesome string'
  end

  def test_parse_for_file
    parser = Parser.new([File.open('example.txt')])
    result = parser.parse
    assert_equal result, 'hello'
  end

  def test_parse_for_zero_arguments
    parser = Parser.new([])
    result = parser.parse
    assert_equal result, nil
  end
end

class ParserParsingOutcomeTest < Test::Unit::TestCase
  def test_parsing_success_for_single_argument
    parser = Parser.new(['hello'])
    result = parser.parse
    assert_equal parser.parsing_outcome, nil
  end

  def test_parsing_outcome_failed_for_no_arguments
    parser = Parser.new([])
    result = parser.parse
    assert_equal parser.parsing_outcome, :parsing_error
  end

  def test_parsing_outcome_failed_for_multiple_arguments
    parser = Parser.new(['one', 'two'])
    result = parser.parse
    assert_equal parser.parsing_outcome, :parsing_error
  end

  def test_parsing_outcome_for_valid_file_argument
    parser = Parser.new([File.open('example.txt')])
    result = parser.parse
    assert_equal parser.parsing_outcome, nil
  end

  def test_parsing_outcome_for_directory_argument
    parser = Parser.new([File.open('/')])
    result = parser.parse
    assert_equal parser.parsing_outcome, nil
  end
end