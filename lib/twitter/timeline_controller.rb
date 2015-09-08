module Twitter
  #Handles the timeline operation
  class TimelineController
    def initialize(username)
      @model = TimelineModel.new(username)
    end

    def process
      tweets = @model.get_tweets
      TimelineInterface.new(tweets).render
    end
  end
end
