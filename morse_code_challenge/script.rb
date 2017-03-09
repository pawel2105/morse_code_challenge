#!/usr/bin/env ruby
require_relative 'obfuscator'
require_relative 'parser'
require_relative 'encoder'

# Only run encoding when this script is executed directly via the CLI
# Prevents script from auto-running for test runner

if $0 == __FILE__
  parser = Parser.new(ARGV)
  parsed_result = parser.parse

  if parser.parsing_outcome == :parsing_failed
    parser.display_help_message
    exit
  end

  encoder = Encoder.new(parsed_result)
  encoded_message = encoder.encode_message

  obfuscator = Obfuscator.new(encoded_message)
  obfuscated_result = obfuscator.obfuscate

  puts obfuscated_result
end