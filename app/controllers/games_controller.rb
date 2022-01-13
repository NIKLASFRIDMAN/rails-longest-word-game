class GamesController < ApplicationController
  def new
    @letters = [*'A'..'Z'].sample(10)
    @letters = @letters.join(' ')
  end

  def score
    raise
  end
end
