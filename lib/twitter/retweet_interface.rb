module Twitter
  class RetweetInterface
    def initialize(data)
      @data = data
    end

    def get_tweet_id
      input = ""
      while !(@data.has_key?(input))
        Kernel.print "\n\n\tEnter index of tweet to retweet : "
        input = $stdin.gets.strip.to_i
      end 
      @data[input]
    end

    def same_user_error
      Kernel.puts "\n\tYou cannot retweet your own tweet."
    end
  end
end
