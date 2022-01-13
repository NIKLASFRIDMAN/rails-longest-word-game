require 'open-uri'
# require 'json'

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)
  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters]
    @word = params[:word].upcase
    @answer = ["Congrutalations #{@word} is an English"]

    if @included = included?(@word, @letters)
    elsif @answer = "you need to use characters given to you"
    end

    if
    @english_word = english_version?(@word)
    elsif @answer = "it has to be an english word"
    end
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_version?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
