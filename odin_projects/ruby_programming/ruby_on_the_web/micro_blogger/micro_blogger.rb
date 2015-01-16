require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140 && message.length != 0
      @client.update(message)
      puts "Tweet sent!"
    else
      puts "Error: Your tweet either did not have anything, or it was over 140 characters. Please try again."
    end
  end

  def get_timeline
    puts "#{client.home_timeline}"
  end

  def dm(target, message)
    followers = @client.followers.collect { |follower| @client.user(follower).scren_name }
    if followers.include?(target)
      puts "Sending #{target} this direct message:"
      puts message
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "Error: It appears this person is not following you."
    end
  end

  def followers_list
    screen_names = []
    followers = @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    screen_names
  end

  def spam_my_followers(message)
    followers_list.each { |follower| dm(follower, message) }
  end

  def everyones_last_tweet
    friends = @client.friends
    friends.each do |friend|
      friend. #TODO ------
    end
  end

  def run
    puts
    puts "Welcome to the CLI Twitter Client!"

    command = ''
    while command != 'quit'
      printf "Enter a command: "
      input = gets.chomp
      parts = input.split(' ')
      command = parts[0].downcase

      case command
      when 'tweet'   then tweet(parts[1..-1].join(' ')) && puts 
        "Tweet sent!"
      when 'feed'    then get_timeline # TODO -----
      when 'message' then dm(parts[1..-1].join(' '))
      when 'spam'    then spam_my_followers(message)
      when 'quit'    then puts "Goodbye!"
      else 
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run