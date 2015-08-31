module Twitter
  #validate raw input
  class SignUpInterface
    INPUTS = ['Username', 'Password']

    def initialize(db_connection, inputs)
      @db_connection = db_connection
      @inputs = inputs
    end

    def process
      user = User.new(@inputs[0], @inputs[1] , @db_connection)
      if user.valid_credentials?
        user.sign_up
      else
        "Bad Username or Password"
      end
    end
  end
end
