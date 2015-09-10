module Twitter
  #db queries for searching user
  class SearchUserModel
    def initialize(username)
      @username = username
    end

    def found_user?
      result = Connection.open.exec("select * from users where username = $1", [@username])
      result.ntuples > 0 ? true : false
    end
  end
end
