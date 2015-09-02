module Twitter
  #validate raw input
  class SignUpInterface
    INPUTS = ['Username', 'Password']

    def initialize(inputs)
      @inputs = inputs
    end

    def process
      user = User.new(@inputs[0], @inputs[1])
      if user.valid_credentials?
        user.sign_up
      else
        "Bad Username or Password"
      end
    end
  end
end
