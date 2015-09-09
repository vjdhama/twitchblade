module Twitter
  #search controller
  class SearchUserController
    def initialize
      @interface = SearchUserInterface.new
    end

    def process
      @interface.render_header
      @interface.render_requirement
      username = @interface.get_username
      @model = SearchUserModel.new(username)
      @model.found_user? ? @interface.render_success : @interface.render_failure
      ""
    end
  end
end
