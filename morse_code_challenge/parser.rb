class Parser
  attr_accessor :parsing_outcome

  def initialize(arguments)
    @arguments = arguments
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