require "spec_helper"

module Twitter
  describe "LoginInterface" do    
    before(:all) do
      @db_connection = DatabaseConnection.new("twitter_spec").conn
    end

    before(:each) do
      @login_interface = LoginInterface.new(@db_connection, ["abc", "345"])
      @db_connection.exec("insert into users (username, password) values ('vijay', '123')")
    end

    after(:each) do
      @db_connection.exec("delete from users")
    end

    it "should call user login on valid input" do
      expect_any_instance_of(User).to receive(:login)
      @login_interface.process
    end
  end
end
