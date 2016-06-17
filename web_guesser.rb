require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:num => SECRET_NUMBER, :message => message, :user_guess => guess}
end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    message = "Way too high!"
  elsif guess > SECRET_NUMBER
    message = "Too high!"
  elsif guess < SECRET_NUMBER - 5
    message = "Way too low"
  elsif guess < SECRET_NUMBER
    message = "Too low"
  else
    message = "The secret number is #{SECRET_NUMBER}. You got it right!"
  end
end
