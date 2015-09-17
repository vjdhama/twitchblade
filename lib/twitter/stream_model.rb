module Twitter
  class StreamModel
    def initialize(username)
      @username = username
    end

    def get_all_tweets
      user_id = get_user_id(@username)
      follower_ids = get_follower_ids(user_id)
      users_ids = follower_ids << user_id
      get_tweets(users_ids)
    end

    private

    def get_user_id(username)
      Connection.open.exec("select uid from users where username = $1", [username]).getvalue(0, 0)
    end

    def get_follower_ids(user_id)
      followers = []
      Connection.open.exec("select followed_id from follow where follower_id = $1", [user_id]).each { |follower| followers << follower["followed_id"]}
      followers
    end

    def get_tweets(users)
      result = []
      users.each {|user_id| Connection.open.exec("select content from tweets where user_id = $1" ,[user_id]).each {|content| result << content["content"]} }
      result
    end
  end
end
