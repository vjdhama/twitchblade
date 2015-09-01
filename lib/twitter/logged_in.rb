module Twitter
  #save the logged in user instance variable
  class LoggedIn
    @username = nil
    @user

    class << self
      attr_accessor :username
      attr_accessor :user
    end
  end
end
