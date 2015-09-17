module Twitter
  #search controller
  class SearchUserController
    def initialize
      @interface = SearchUserInterface.new
      @username =  ""   
    end

    def process
      @interface.render_header
      @interface.render_requirement
      @username = @interface.get_username
      @model = SearchUserModel.new(@username)
      if @model.found_user? 
        @interface.render_success
        run
      else 
        @interface.render_failure
      end
      ""
    end

    private

    def run
      while(true)
        @interface.render_menu
        input = @interface.get_menu_option
        if  input == "1"
          TimelineController.new(@username).process
        elsif input == "2"
          FollowController.new(LoggedIn.username, @username).process
        elsif input == "3"
          break
        else
          @interface.print_invalid_input
        end
      end
    end
  end
end
