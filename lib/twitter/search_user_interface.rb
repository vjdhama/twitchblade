module Twitter
  class SearchUserInterface

    def initialize

    end

    def get_username
      $stdin.gets.strip
    end

    private

    def render_header
      $stdin.puts "\n\tSearch"
      $stdin.puts
    end

    def render_requirement
      puts "Enter a username for searching"
      print "Username : "
    end
  end
end
