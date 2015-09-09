module Twitter
  class SearchUserInterface

    def initialize
      @username = ""
    end

    def get_username
      @username = Kernel.gets.strip
      @username
    end

    def render_header
      Kernel.puts "\n\tSearch"
      Kernel.puts
    end

    def render_requirement
      Kernel.print "Username : "
    end

    def render_success
      Kernel.puts "Found : '#{@username}'"
    end

    def render_failure
      Kernel.puts "Could not find '#{@username}' in our system"
    end
  end
end
