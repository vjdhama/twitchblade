module Twitter
  #save the logged in user instance variable
  class LoggedIn
    @username = nil

    class << self
      attr_accessor :user
    end
  end
end
