module Twitter
  #Executes database queries related to timeline 
  class TimelineModel
    attr_reader :data
    
    def initialize(username)
      @username = username
      @data = {}
    end

    def get_tweets
      tweets = []
      user_id = get_user_id
      result = Connection.open.exec("select content, tweet_id from tweets where user_id = $1", [user_id])
      result.each do |tuple| 
        tweets << tuple["content"]
        @data[result.find_index(tuple) + 1] =  tuple["tweet_id"]
      end
      tweets
    end

    private

    def get_user_id
      Connection.open.exec("select uid from users where username = $1", [@username]).getvalue(0, 0)
    end
  end
end
