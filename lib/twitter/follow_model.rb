module Twitter
  #db queries related to follow
  class FollowModel
    def initialize(follower, followed)
      @follower_id = get_user_id(follower)
      @followed_id = get_user_id(followed)
    end

    def save
      Connection.open.exec("insert into follow (follower_id, followed_id) values($1, $2)", [@follower_id, @followed_id])
    end
    
    private

    def get_user_id(username)
      result = Connection.open.exec("select uid from users where username = $1", [username])
      result.getvalue(0, 0).to_i
    end
  end
end
