module Twitter
  #
  class TweetController
    def initialize
      @model = TweetModel.new("i am batman")
    end
    
    def tweet
      @model.save
    end

  end
end
