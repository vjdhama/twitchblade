module Twitter
  class RetweetController
    def initialize(data)
      @interface = RetweetInterface.new(data)
    end

    def process
      input = @interface.get_tweet_id
      @model = RetweetModel.new(input)
      @model.can_retweet? ? @model.save : @interface.same_user_error
    end
  end
end
