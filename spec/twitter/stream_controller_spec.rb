require "spec_helper"

module Twitter
  describe "StreamController" do
    let(:stream) { StreamController.new("vjdhama") }

    it "should get tweets using model and send them to be rendered by interface" do
      allow_any_instance_of(StreamModel).to receive(:get_all_tweets).and_return(['testing', 'now resting'])
      expect_any_instance_of(StreamInterface).to receive(:render)
      stream.process
    end
  end
end
