class WordGuesserGame
  attr_accessor :guesses, :word, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    letter = letter.to_s[0]
    letter = letter ? letter.downcase : ''

    if letter == '' || !('a'..'z').include?(letter)
      raise ArgumentError
    end
  
    if (@guesses + @wrong_guesses).include?(letter)
      return false
    end
  
    if @word.downcase.include?(letter)
      @guesses += letter
    else
      @wrong_guesses += letter
    end
  
    return true
  end

  def word_with_guesses
    @word.chars.map { |c| @guesses.include?(c.downcase) ? c : '-' }.join
  end

  # Class method to get random word 
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start do |http|
      http.post(uri, '').body
    end
  end
end
