class Obfuscator
  DASH_HASH = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E' }

  def initialize(message)
    @message = message
  end

  def obfuscate
    obfuscated_dots_message = obfuscate_with('.', @message)
    obfuscate_with('-', obfuscated_dots_message)
  end

  def obfuscate_with(type, message)
    chunks = get_chunks(type, message)
    result = obfuscate_chunks(type, chunks)
    result.flatten.join('')
  end

  private

  def get_chunks(type, message)
    message.chars.chunk do |character|
      character == type
    end
  end

  def handle_chunk_conversion(type, chunk, result)
    if type == '.'
      result.push(chunk.size)
    else
      result.push(DASH_HASH[chunk.size])
    end
  end

  def obfuscate_chunks(type, chunks)
    result = []

    chunks.each do |chunk_is_convertible, chunk|
      if chunk_is_convertible
        handle_chunk_conversion(type, chunk, result)
      else
        result.push(chunk)
      end
    end

    result
  end
end