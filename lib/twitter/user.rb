module Twitter
  class User

    def initialize(username, password, db_connection)
      @username = username
      @password = password
      @db_connection = db_connection
    end 

    def username_available?
      result = @db_connection.exec("select username from users where username = '#{@username}'")
      result.ntuples == 0 ? true : false
    end

    def sign_up
      @db_connection.exec("insert into users (username, password) values ('#{@username}', '#{@password}')") if username_available?
    end
  end
end