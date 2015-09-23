module Twitter
  class StreamInterface
    def initialize(tweets)
      @tweets = tweets
    end

    def render
      Kernel.puts "\n\tStream"
      @tweets.each do |tweet| 
        Kernel.puts "\t#{@tweets.index(tweet) + 1}. " + tweet
      end
    end

    def render_menu
      Kernel.puts "\n\t1. Retweet    2. Go back"
      Kernel.print "\n\n\tEnter a option : "
      $stdin.gets.strip
    end

    def render_option_error
      Kernel.print  "\n\nWrong option! Try again "
    end
  end
end
