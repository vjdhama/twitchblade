require "spec_helper"

module Twitter
  describe "TimelineInterface" do
    
    before(:each) { @interface = TimelineInterface.new(["i am batman", "i am crazy"]) }

    it "foo" do
      expect(Kernel).to receive(:puts).thrice
      @interface.render
    end
  end
end
