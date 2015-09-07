require 'spec_helper'

module Twitter
  describe "TweetController" do

    before(:each) { @tweet_controller = TweetController.new }

    it "should call save on valid tweet" do
      allow(@tweet_controller).to receive(:empty?).and_return(true, true, false)
      allow_any_instance_of(TweetInterface).to receive(:get_tweet).and_return("", "i am batman")
      expect_any_instance_of(TweetModel).to receive(:save)
      @tweet_controller.tweet
    end
  end
end
