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

    #   def execute
    #     inputs = get_credentials
    #     user = User.new(inputs[0], inputs[1])
    #     if user.valid_credentials?
    #       user.login
    #     else
    #       "Empty username of password."
    #     end
    #   end       

    #   private       

    #   def get_credentials
    #     inputs = []
    #     puts "\n\tLogin"
    #     puts
    #     INPUTS.each do |credential|
    #       print credential + " : "
    #       inputs << get_input.downcase
    #     end
    #     inputs
    #   end
  end
end
