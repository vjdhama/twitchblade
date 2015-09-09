module Twitter
  class SearchUserModel
    def initialize(username)
      @username = username
    end

    def found_user?
      false
    end
  end
end
