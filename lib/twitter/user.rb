module Twitter
  #perform user operations
  class User
    def initialize(username, password)
      @username = username
      @password = password
    end 

    def sign_up
      result = Connection.open.exec("select username from users where username = $1", [@username])
      if result.ntuples == 0  
        Connection.open.exec("insert into users (username, password) values ($1, $2)", [@username, @password])
        "You're Signed Up"
      else
        "Username Not Available"
      end
    end

    def login
      result = Connection.open.exec("select username, password from users where username = $1 and password = $2", [@username, @password])
      if result.ntuples == 1
        LoggedIn.username = @username
        LoggedIn.user = self
        "Logged In"
      else
        "Invalid Credentials"
      end
    end

    def logout
      LoggedIn.username = nil
      LoggedIn.user = nil
      "Logged Out"
    end

    def valid_credentials?
      (@username.empty? || @password.empty?) ? false : true
    end
  end
end
