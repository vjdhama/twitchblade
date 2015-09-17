require "spec_helper"

module Twitter
  describe "TwitterController" do
    let(:controller) { FollowController.new("vijay", "vjdhama") }

    it "should not call save on model if follower and followed are same user" do  
      controller.process
      expect_any_instance_of(FollowModel).to receive(:save)
    end
  end
end
