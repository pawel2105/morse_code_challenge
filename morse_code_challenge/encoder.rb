class Encoder
  MORSE_VALUES_HASH = {
    'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.',
    'G' => '--.', 'H' => '....', 'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..',
    'M' => '--', 'N' => '-.', 'O' => '---', 'P' => '.--.', 'Q' => '--.-', 'R' => '.-.',
    'S' => '...', 'T' => '-', 'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-',
    'Y' => '-.--', 'Z' => '--..', '0' => '-----', '1' => '.----', '2' => '..---', '3' => '...--',
    '4' => '....-', '5' => '.....', '6' => '-....', '7' => '--...', '8' => '---..', '9' => '----.',
    '.' => '.-.-.-', ',' => '--..--'
  }

  def initialize(message)
    @message = message
  end

  def encode_message
    encoded_tokens = []

    lines = @message.split("\n")
    lines.each do |line|
      encode_line(line, encoded_tokens)
    end

    encoded_tokens.join('')
  end

  private

  def encode_line(line, result)
    words = line.split(' ')

    words.each do |word|
      uppercased_word = word.upcase
      encoded_value = encode_word(uppercased_word)
      result.push(encoded_value)
    end

    words
  end

  def encode_word(word)
    encoded_value = ''

    word.split('').each do |character|
      encoded_value += MORSE_VALUES_HASH[character] || '*'
      encoded_value += '|'
    end

    encoded_value += '/'
  end
end