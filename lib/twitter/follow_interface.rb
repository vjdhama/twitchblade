module Twitter
  #display failure and success message for follow
  class FollowInterface
    def render_follow_error
      puts
      puts "\tYou cannnot follow yourself"
      puts
    end

    def render_follow_success(followed)
      puts
      puts "\tYou followed #{followed}"
      puts
    end
  end
end