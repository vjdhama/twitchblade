module Twitter
  #View for timeline
  class TimelineInterface
    def initialize(tweets)
      @tweets = tweets
    end

    def render
      Kernel.puts "\n\tTimeline"
      @tweets.each do |tweet| 
        Kernel.puts "\t#{@tweets.index(tweet) + 1}. " + tweet
      end
    end
  end
end
