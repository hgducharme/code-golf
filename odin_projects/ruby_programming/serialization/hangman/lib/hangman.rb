# require "hangman/version"
require 'csv'

module Hangman
  class Game
    def initialize()
      puts 
      puts "Welcome to CLI hangman! Can you beat the computer?"
      new_game
    end

    def new_game
      dictionary = File.read('hangman/5desk.txt')
      puts dictionary[0...5]
    end
  end # Class - Hangman
end # Module - Hangman

game = Hangman::Game.new
