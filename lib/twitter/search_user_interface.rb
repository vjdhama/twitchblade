module Twitter
  class SearchUserInterface

    def initialize
      @username = ""
    end

    def get_username
      @username = $stdin.gets.strip
      @username
    end

    def render_header
      $stdout.puts "\n\tSearch"
      $stdout.puts
    end

    def render_requirement
      $stdout.print "Username : "
    end

    def render_success
      $stdout.puts "Found : '#{@username}'"
    end

    def render_failure
      $stdout.puts "Could not find user '#{@username}' in our system"
    end
  end
end
