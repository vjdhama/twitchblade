module Twitter
  #perform command line operation
  class CommandLineInterface
    def initialize
      @db_connection = DatabaseConnection.new(ENV["dbname"])
      @@errors = [] 
    end

    def self.add_error(error)
      @@errors << error
    end

    def run
      while(input = get_input)
        display_banner
        process(input)
      end
    end

    def process(choice)
      if choice == 3
        @@errors << "Invalid option"
        display_error
      end
    end

    private

    def display_error
      puts @@errors.last
    end

    def display_banner
      puts "1. SignUp 2. Exit"
      puts "Enter a number(1/2)"
    end

    def get_input
      gets.chomp
    end
  end
end
