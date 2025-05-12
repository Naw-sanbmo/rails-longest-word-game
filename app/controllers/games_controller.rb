require "open-uri"

class GamesController < ApplicationController


  def new
    @letters = 10.times.map { ('A'..'Z').to_a.sample }.join
  end

  def score
    @word = params[:chars]
    url = "https://dictionary.lewagon.com/#{@word}"
    word_serialized = URI.parse(url).read
    result = JSON.parse(word_serialized)
    @english_word = result["found"]
  end
end
