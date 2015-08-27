require "spec_helper"

module Twitter
  describe "SignUpInterface" do
    before(:all) do
      @db_connection = DatabaseConnection.new("twitter_spec").conn
    end

    before(:each) do
      @sign_up_interface = SignUpInterface.new(@db_connection, ["abc", "345"])
    end

    after(:each) do
      @db_connection.exec("delete from users")
    end

    it "should call user sign_up on valid input" do
      expect_any_instance_of(User).to receive(:sign_up)
      @sign_up_interface.process
    end
  end
end
