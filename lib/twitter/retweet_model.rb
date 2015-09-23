module Twitter
  class RetweetModel
    def initialize(id)
      @id = id
    end

    def can_retweet?
      user_id_tweet = Connection.open.exec("select user_id from tweets where tweet_id = $1", [@id]).getvalue(0, 0)
      user_id_logged_in_user = Connection.open.exec("select uid from users where username = $1", [LoggedIn.username]).getvalue(0, 0)
      user_id_tweet == user_id_logged_in_user ? false : true
    end

    def save
      content = Connection.open.exec("select content from tweets where tweet_id = $1", [@id]).getvalue(0, 0)
      user_id = Connection.open.exec("select uid from users where username = $1", [LoggedIn.username]).getvalue(0, 0)
      Connection.open.exec("insert into tweets (content, user_id, retweet_id) values ($1,  $2, $3)", [content, user_id, @id])
    end
  end
end