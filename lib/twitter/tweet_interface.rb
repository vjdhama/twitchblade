module Twitter
  #views of tweet
  class TweetInterface
    INPUTS = ["Tweet"]

    def get_tweet
      tweet_content = []
      INPUTS.each do |input|
        print input + " : "
        tweet_content << user_input
      end
      tweet_content
    end

    private

    def user_input
      $stdin.gets.strip
    end
  end
end