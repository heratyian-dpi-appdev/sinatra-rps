require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:root)
end

get("/:move") do
  @user_move = params[:move].downcase
  @computer_move = ["rock", "paper", "scissors"].sample
  @outcome = calculate_outcome(@user_move, @computer_move)

  erb :move
end

def calculate_outcome(user_move, computer_move)
  if user_move == "rock"
    return "won" if computer_move == "scissors"
    return "lost" if computer_move == "paper"
    return "tied" if computer_move == "rock"
  elsif user_move == "paper"
    return "won" if computer_move == "rock"
    return "lost" if computer_move == "scissors"
    return "tied" if computer_move == "paper"
  elsif user_move == "scissors"
    return "won" if computer_move == "paper"
    return "lost" if computer_move == "rock"
    return "tied" if computer_move == "scissors"
  else
    return "illegal move"
  end
end
