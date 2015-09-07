module Twitter
  #Confused
  class TweetController
    def initialize
      @content = ""
    end

    def tweet
      while empty?
        @content = TweetInterface.new.get_tweet
      end
      @model = TweetModel.new(@content[0]).save
      "\n\tYou Tweeted : " + @content[0]
    end

    private

    def empty?
      @content.nil? || @content.empty?
    end
  end
end
