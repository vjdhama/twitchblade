module Twitter
  #perform command line operation
  class CommandLineInterface
    def initialize
      @@errors = [] 
    end

    def self.add_error(error)
      @@errors << error
    end

    def run
      while(true)
        display_banner
        output = process_banner_input(get_input)
        display_banner_output(output)
      end
    end

    def process_banner_input(choice)
      if LoggedIn.username.nil?
        if choice == "1"
          inputs = get_inputs(SignUpInterface::INPUTS, "SignUp")
          SignUpInterface.new(inputs).process
        elsif choice == "2"
          inputs = get_inputs(LoginInterface::INPUTS, "Login")
          LoginInterface.new(inputs).process
        elsif choice == "3"
          Connection.close
          exit
        else
          @@errors << "\n\tInvalid choice. Try again!!"
        end
      else
        if choice == "1"
          TweetController.new.tweet
        elsif choice == "2"
          TimelineController.new(LoggedIn.username).process
        elsif choice == "3"
          StreamController.new(LoggedIn.username).process          
        elsif choice == "4"
          SearchUserController.new.process
        elsif choice == "5"
          LoggedIn.user.logout
        else
          @@errors << "\n\tInvalid choice. Try again!!"
        end
      end
    end

    private

    def display_banner_output(output)
      if output.is_a?(String)
        puts output
      else
        puts @@errors.last
      end
    end

    def get_inputs(input_requirements, operation)
      inputs = []
      puts "\n\t" + operation
      puts
      input_requirements.each do |credential|
        print credential + " : "
        inputs << get_input.downcase
      end
      inputs
    end

    def display_error
      puts @@errors.last
    end

    def display_banner
      if LoggedIn.username.nil?
        puts "\n\t1. SignUp    2. Login    3. Exit\n\n"
        print  "Enter a choice : "
      else
        puts "\n\t1. Tweet    2. Timeline    3. Stream    4. Search    5. Logout\n\n"
        print  "Enter a choice : "
      end
    end

    def get_input
      $stdin.gets.strip
    end
  end
end
