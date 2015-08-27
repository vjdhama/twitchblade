module Twitter
  class User

    def initialize(username, password, db_connection)
      @username = username
      @password = password
      @db_connection = db_connection
    end 

    def sign_up
      result = @db_connection.exec("select username from users where username = '#{@username}'")
      @db_connection.exec("insert into users (username, password) values ('#{@username}', '#{@password}')") if result.ntuples == 0
    end
  end
end