require_relative 'tic_tac_toe.rb'

puts "Welcome to tic tac toe!"
bob = TicTacToe::Player.new({color: "X", name: "Bob"})
frank = TicTacToe::Player.new({color: "O", name: "Frank"})
players = [bob, frank]
TicTacToe::Game.new(players).play