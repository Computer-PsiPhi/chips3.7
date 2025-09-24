class WordGuesserGame
  attr_accessor :guesses, :word, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    raise ArgumentError if letter.nil? || letter == ''
    ch = letter.downcase
    raise ArgumentError unless ch >= 'a' && ch <= 'z'


    return false if (@guesses + @wrong_guesses).include?(ch)

    if @word.downcase.include?(ch)
      @guesses = @guesses + ch
    else
      @wrong_guesses = @wrong_guesses + ch
    end
    true
  end

  def word_with_guesses
    @word.chars.map { |c| @guesses.include?(c.downcase) ? c : '-' }.join
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start do |http|
      http.post(uri, '').body
    end
  end
end
