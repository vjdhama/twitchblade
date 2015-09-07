require "spec_helper"

module Twitter
  describe "TweetInterface" do

    before(:each) { @tweet_interface = TweetInterface.new }

    it "should take input from user" do
      allow(@tweet_interface).to receive(:user_input).and_return("testing")
      expect(@tweet_interface.get_tweet).to be_an_instance_of(Array)
    end
  end
end
