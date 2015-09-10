module Twitter
  #Executes database queries related to timeline 
  class TimelineModel
    def initialize(username)
      @username = username
    end

    def get_tweets
      tweets = []
      user_id = get_user_id
      result = Connection.open.exec("select content from tweets where user_id = $1", [user_id])
      result.each {|tuple| tweets << tuple["content"]}
      tweets
    end

    private

    def get_user_id
      Connection.open.exec("select uid from users where username = $1", [@username]).getvalue(0, 0)
    end
  end
end

