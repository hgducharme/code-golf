require 'jumpstart_auth'
require 'Bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts 
    puts "MicroBlogger Initialized."
    @client = JumpstartAuth.twitter
  end

  def run
    puts "Welcome to the CLI Twitter Client!"
    puts

    command = ''
    while command != 'quit'
      puts
      puts "-- tweet [message]           |  Tweet the specified message"
      puts "-- tweet_url [message] [url] |  Tweet a message that also contains a url. The URL must be at the end for this to work."
      puts "-- last_tweets               |  Retrieve the last tweet from each person you follow"
      puts "-- message [user] [message]  |  Send a message to the specified user"
      puts "-- spam [message]            |  Spam your followers with the specified message"
      puts "-- timeline                  |  Output your home page timeline"
      puts "-- quit                      |  Quit the Twitter Client"
      puts 

      printf "Enter a command: "
      input = gets.chomp
      parts = input.split(' ')
      command = parts[0].downcase

      case command
      when 'tweet'        then tweet(parts[1..-1].join(' ')) && puts 
        "Tweet sent!"
      when 'tweet_url'    then tweet_url(parts[1..-2].join(' '), parts[-1])
      when 'last_tweets'  then everyones_last_tweet
      when 'message'      then dm(parts[1], parts[2..-1].join(' '))
      when 'spam'         then spam_my_followers(parts[1..-1].join(' '))
      when 'timeline'     then get_home_timeline
      when 'quit'    then puts "Goodbye!"
      else 
        puts "Sorry, '#{command}' was not a valid entry."
      end  
    end
  end

  private

  def tweet(message)
    if message.length <= 140 && message.length != 0
      @client.update(message)
      puts "Tweet sent!"
    else
      puts "Error: Your tweet either did not have anything, or it was over 140 characters. Please try again."
    end
  end

  def tweet_url(message, url)
    short_url = shorten(url)
    full_tweet = "#{message} #{short_url}"
    tweet(full_tweet)
  end

  def everyones_last_tweet
    puts "Retrieving your last tweets... This might take a minute."

    friends = []
    @client.friends.each { |friend| friends << @client.user(friend) }
    friends.sort_by { |friend| friend.screen_name }

    friends.each do |friend|
      last_tweet = friend.status.text
      timestamp = friend.status.created_at
      timestamp = timestamp.strftime('%l:%M %P - %e %b %Y')

      puts ''
      puts "#{friend.screen_name}'s last tweet was:"
      puts last_tweet
      puts "Tweeted at: #{timestamp}"
      puts "-----------------------------------------------"
    end
  end

  def dm(target, message)
    followers = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if followers.include?(target)
      puts "Sending #{target} this direct message:"
      puts message
      message = "@#{target} #{message}"
      tweet(target, message)
    else
      puts "Error: Either you supplied no message, or #{target} is not a follower of yours."
    end
  end

  def spam_my_followers(message)
    followers_list.each { |follower| dm(follower, message) }
  end

  def get_home_timeline
    puts "Getting your timeline... This might take a minute."
    tweets = @client.home_timeline

    tweets.each do |tweet|
      author = tweet.user.screen_name
      text = tweet.text
      timestamp = tweet.created_at
      timestamp = timestamp.strftime('%l:%M %P - %e %b %Y')

      puts "@#{author} tweeted:"
      puts text
      puts "Tweeted at: #{timestamp}"
      puts "-----------------------------------------------"
    end
  end

  def followers_list
    screen_names = []
    followers = @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    screen_names
  end

  def shorten(original_url)
    puts "Shortening this URL: #{original_url}"

    Bitly.use_api_version_3

    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    short_url = bitly.shorten(original_url).short_url
  end

end

blogger = MicroBlogger.new
blogger.run