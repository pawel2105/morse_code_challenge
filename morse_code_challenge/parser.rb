class Parser
  attr_accessor :parsing_outcome

  def initialize(arguments)
    @arguments = arguments
  end

  def display_help_message
    puts "\nUse a single argument when running this script. If you are trying to provide a string please wrap it in quotes.\n"
    puts "Example for string usage: ruby morse_code_encoder.rb \"THIS IS AN EXAMPLE\"\n"
    puts "Example for files usage:  ruby morse_code_encoder.rb filename.txt\n"
    puts "Note that if a file is not found then it will be interpreted as a single word\n\n"
  end

  def parse
    ensure_correct_number_of_arguments
    content_to_encode = extract_message_from_argument
  end

  private

  def ensure_correct_number_of_arguments
    if @arguments.length != 1
      @parsing_outcome = :parsing_error
    end
  end

  def extract_message_from_argument
    arg = @arguments[0]
    return if @parsing_outcome == :parsing_error

    if File.file?(arg)
      File.read(arg)
    else
      arg
    end
  end
end