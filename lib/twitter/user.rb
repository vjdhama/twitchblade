module Twitter
  class User

    def initialize(username, password, db_connection)
      @username = username
      @password = password
      @db_connection = db_connection
    end 

    def sign_up
      result = @db_connection.exec("select username from users where username = '#{@username}'")
      if result.ntuples == 0  
        @db_connection.exec("insert into users (username, password) values ('#{@username}', '#{@password}')")
      else
        :username_exits
      end
    end

    def valid?
      !@username.empty?
    end

  end
end