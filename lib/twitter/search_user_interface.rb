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
      $stdin.puts "\n\tSearch"
      $stdin.puts
    end

    def render_requirement
      $stdin.print "Username : "
    end

    def render_success
      $stdin.puts "Found : '#{@username}'"
    end

    def render_failure
      $stdin.puts "Could not find '#{@username}' in our system"
    end
  end
end
