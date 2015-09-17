require "spec_helper"

module Twitter
  describe "StreamInterface" do
    let(:interface) { StreamInterface.new(["test", "rest"]) }

    it "should display content to STDOUT" do
      expect(Kernel).to receive(:puts).thrice
      interface.render
    end
  end
end
