module Twitter
  class StreamModel
    attr_reader :data

    def initialize(username)
      @username = username
      @data = {}
    end

    def get_all_tweets
      user_id = get_user_id(@username)
      follower_ids = get_follower_ids(user_id)
      users_ids = follower_ids.unshift(user_id)
      get_tweets(users_ids)
    end

    private

    def get_user_id(username)
      Connection.open.exec("select uid from users where username = $1", [username]).getvalue(0, 0)
    end

    def get_follower_ids(user_id)
      followers = []
      Connection.open.exec("select followed_id from follow where follower_id = $1", [user_id]).each do |follower| 
        followers << follower["followed_id"]
      end
      followers
    end

    def get_tweets(users)
      tweets = []
      tweet_count = 1
      users.each  do |user_id| 
        result = Connection.open.exec("select content, tweet_id from tweets where user_id = $1" ,[user_id])
        result.each do |tuple| 
          if !(tweets.include?(tuple["content"]))
            tweets << tuple["content"] 
            @data[tweet_count] =  tuple["tweet_id"]
            tweet_count += 1
          end
        end 
      end
      tweets
    end
  end
end
