require 'spec_helper'

module Twitter
  describe "TweetController" do

    before(:each) { @tweet_controller = TweetController.new }

    it "foo" do
      expect_any_instance_of(TweetModel).to receive(:save) 
      @tweet_controller.tweet
    end
  end
end
