module Twitter
  #interface for Login
  class LoginInterface
    INPUTS = ['Username', 'Password']

    def initialize(inputs)
      @inputs = inputs
    end

    def process
      user = User.new(@inputs[0], @inputs[1])
      if user.valid_credentials?
        user.login
      else
        "Empty username or password."
      end
    end
  end
end
