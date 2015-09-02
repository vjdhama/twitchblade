require "spec_helper"

module Twitter
  describe "SignUpInterface" do

    before(:each) do
      @sign_up_interface = SignUpInterface.new(["abc", "345"])
      Connection.open.exec("insert into users (username, password) values ('vijay', '123')")
    end

    after(:each) do
      Connection.open.exec("delete from users")
    end

    it "should call user sign_up on valid input" do
      expect_any_instance_of(User).to receive(:sign_up)
      @sign_up_interface.process
    end

    it "should return Bad username or password on null input" do
      sign_up_interface = SignUpInterface.new(["", "345"])
      expect(sign_up_interface.process).to eq("Bad Username or Password")
    end
  end
end
