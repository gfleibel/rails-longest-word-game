require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle.sample(10)
    @score = session[:score]
    @counter = session[:counter]
  end

  def score
    @word = params[:word].downcase.split("")
    @score = 0
    session[:counter] = 3 unless session[:counter]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @response = JSON.parse(URI.open(url).read)
    @letters = params[:letters].downcase.split
    if (@word & @letters) != @word
      @message = "Sorry, but #{params[:word]} can't be  built out of #{@letters.join(", ").upcase}."
      session[:counter] -= 1
      @score = session[:score]
    elsif (@word & @letters) == @word && @response["found"] == true
      @message = "The word #{params[:word]} is valid according to the grid and is an English word."
      @score += @word.size
      if session[:score]
        session[:score] += @score
      else
        session[:score] = 0
      end
    else
      @message = "The word #{params[:word]} is valid according to the grid, but is not a valid English word."
      session[:counter] -= 1
      @score = session[:score]
    end
    if session[:counter].zero? || session[:counter].negative?
      @message = "You have no more tries left. The game will now reset."
      @score = session[:score]
    end
  end

  def reset
    session[:score] = 0
    session[:counter] = 3
    redirect_to new_path
  end
end
