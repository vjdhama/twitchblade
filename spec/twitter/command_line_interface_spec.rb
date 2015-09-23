require "spec_helper"

module Twitter
  describe "CommandLineInterface" do
    
    before(:each) do 
      @cli = CommandLineInterface.new 

      name = "vijay"
      password = "pass"

      Connection.open.exec("begin")
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name, password])
    end

    after(:each) do
      Connection.open.exec("rollback")
    end

    it "should sign up when user not logged in and input is 1" do
      allow($stdin).to receive(:gets).and_return("foo", "bar")
      expect_any_instance_of(SignUpInterface).to receive(:process)
      @cli.process_banner_input("1")
    end

    it "should sign up when user not logged in and input is 1" do
      allow($stdin).to receive(:gets).and_return("qaz", "123")
      expect_any_instance_of(LoginInterface).to receive(:process)
      @cli.process_banner_input("2")
    end

    it "should tweet when user is logged in and input is 1" do
      allow($stdin).to receive(:gets).and_return("vijay", "pass")
      LoggedIn.username = "vijay"
      expect_any_instance_of(TweetController).to receive(:tweet)
      @cli.process_banner_input("1")
    end 
    
    it "should show timeline of logged in user" do
      LoggedIn.username = "vijay"
      expect_any_instance_of(TimelineController).to receive(:process)
      @cli.process_banner_input("2")
    end 

    it "should show stream of logged in user" do
      LoggedIn.username = "vijay"
      expect_any_instance_of(StreamController).to receive(:process)
      @cli.process_banner_input("3")
    end

    it "should open search menu" do
      LoggedIn.username = "vijay"
      expect_any_instance_of(SearchUserController).to receive(:process)
      @cli.process_banner_input("4")
    end

    it "should loggout user" do
      LoggedIn.username = "vijay"
      LoggedIn.user = User.new("vijay", "pass")
      @cli.process_banner_input("5")
      expect(LoggedIn.username).to eq(nil)
    end
  end
end
