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

    private

    def render_requirement
      puts "Enter a username for searching"
      print "Username : "
    end
  end
end
