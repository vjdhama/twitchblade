module Twitter
  class SignUpInterface
    INPUTS = ['Username', 'Password']

    def initialize(db_connection, inputs)
      @db_connection = db_connection
      @inputs = inputs
    end

    def process
      user = User.new(@inputs[0], @inputs[1] , @db_connection)
      if user.valid?
        user.sign_up
      end
    end
  end
end