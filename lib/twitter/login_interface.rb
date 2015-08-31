module Twitter
  class LoginInterface
    def initialize(db_connection, inputs)
      @db_connection = db_connection
      @inputs = inputs
    end

    def process
      user = User.new(@inputs[0], @inputs[1] , @db_connection)
      user.login
    end
  end
end