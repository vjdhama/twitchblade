require "spec_helper"

module Twitter
  describe "RetweetController" do
    let(:controller) { RetweetController.new({1 => "6" }) }
    
    it "should retweet using model" do
      allow_any_instance_of(RetweetInterface).to receive(:get_tweet_id).and_return("5")
      allow_any_instance_of(RetweetModel).to receive(:can_retweet?).and_return(true)
      expect_any_instance_of(RetweetModel).to receive(:save)
    end
  end
end
