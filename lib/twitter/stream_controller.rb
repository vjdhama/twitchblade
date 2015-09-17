module Twitter
  class StreamController
    def initialize(username)
      @model = StreamModel.new(username)
    end

    def process
      tweets = @model.get_all_tweets
      StreamInterface.new(tweets).render
    end
  end
end