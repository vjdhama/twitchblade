require "spec_helper"

module Twitter
  describe "TwitterController" do
    let(:controller_1) { FollowController.new("vijay", "vjdhama") }
    let(:controller_2) { FollowController.new("vijay", "vijay") }

    before(:each) do 
      username_1 = "vijay"
      username_2 = "vjdhama"

      password_1 = "pass"
      password_2 = "pass"

      Connection.open.exec("begin")
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [username_1, password_1])
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [username_2, password_2])
    end

    after(:each) { Connection.open.exec("rollback") }
    
    it "should call render success if follower and followed are same user" do 
      expect_any_instance_of(FollowInterface).to receive(:render_follow_success) 
      controller_1.process
    end

    it "should call render error if follower and followed are same user" do 
      expect_any_instance_of(FollowInterface).to receive(:render_follow_error)
      controller_2.process
    end
  end
end
