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
  end
end
