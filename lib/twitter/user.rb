module Twitter
  #perform user operations
  class User
    def initialize(username, password, db_connection)
      @username = username
      @password = password
      @db_connection = db_connection
    end 

    def sign_up
      result = @db_connection.exec("select username from users where username = $1", [@username])
      if result.ntuples == 0  
        @db_connection.exec("insert into users (username, password) values ('#{@username}', '#{@password}')")
        "You're Signed Up"
      else
        "Username Not Available"
      end
    end

    def login
      result = @db_connection.exec("select username, password from users where username = '#{@username}' and password = '#{@password}'")
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
