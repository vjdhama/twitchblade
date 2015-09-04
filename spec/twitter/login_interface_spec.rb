require "spec_helper"

module Twitter
  describe "LoginInterface" do  

    before(:each) do
      @login_interface = LoginInterface.new(["abc", "345"])
      Connection.open.exec("insert into users (username, password) values ('vijay', '123')")
    end

    after(:each) do
      Connection.open.exec("delete from users")
    end

    it "should call user login on valid input" do
      expect_any_instance_of(User).to receive(:login)
      @login_interface.process
    end 
  end
end
