module Twitter
  #Db queries for tweet
  class TweetModel
    INPUTS = ["Tweet"]

    def initialize(content)
      @content = content
    end

    def save
      user_id = logged_in_user_id
      Connection.open.exec("insert into tweets (content, user_id) values ('#{@content}', '#{user_id}')")
    end

    private

    def logged_in_user_id
      Connection.open.exec("select uid from users where username = '#{LoggedIn.username}'").getvalue(0, 0).to_i
    end
  end
end
