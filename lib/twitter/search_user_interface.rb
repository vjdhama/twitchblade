module Twitter
  class SearchUserInterface

    def initialize
      @username = ""
    end

    def get_username
      @username = $stdin.gets.strip
      @username
    end

    def get_menu_option
      $stdin.gets.strip
    end

    def render_header
      $stdout.puts "\n\tSearch"
      $stdout.puts
    end

    def render_requirement
      $stdout.print "Username : "
    end

    def render_success
      $stdout.puts "\n\t'#{@username}'"
    end

    def render_failure
      $stdout.puts "\n\tCould not find user '#{@username}' in our system"
    end

    def render_menu
      $stdout.puts
      $stdout.puts "\t1. Timeline    2. Go Back"
      $stdout.puts
      $stdout.print "\tEnter a option : "
    end

    def render_invalid_option_error
      $stdout.puts "\n\tYou're a naughty dude!! Try again!!"
    end
  end
end
