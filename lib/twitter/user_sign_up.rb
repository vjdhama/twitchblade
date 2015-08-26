module Twitter
  class UserSignUp
    attr_reader :db_connection

    def initialize(username, password, db_connection)
      @username = username
      @password = password
      @db_connection = db_connection
    end 

    def username_available?
      result = @db_connection.exec("select username from users where username = '#{@username}'")
      result.ntuples == 0 ? true : false
    end
  end
end