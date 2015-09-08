require "spec_helper"

module Twitter
  describe "TimeLineController" do
    
    before(:each) { @timeline = TimelineController.new("vjdhama") }

    it "should call render on timeline interface returned from db" do
      allow_any_instance_of(TimelineModel).to receive(:get_tweets).and_return(['testing', 'now resting'])
      expect_any_instance_of(TimelineInterface).to receive(:render)
      @timeline.process
    end
  end
end
