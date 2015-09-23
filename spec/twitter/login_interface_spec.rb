require "spec_helper"

module Twitter
  describe "LoginInterface" do  

    before(:each) do
      name = "vijay"
      password = "pass"

      @login_interface = LoginInterface.new([name, password])
      Connection.open.exec("begin")
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name, password])
    end

    after(:each) do
      Connection.open.exec("rollback")
    end

    it "should call user login on valid input" do
      allow_any_instance_of(User).to receive(:valid_credentials?).and_return(true)
      expect_any_instance_of(User).to receive(:login)
      @login_interface.process
    end 
  end
end
