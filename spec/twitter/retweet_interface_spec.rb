require "spec_helper"

module Twitter
  describe "RetweetInterface" do
    let(:interface) { RetweetInterface.new }
    
    it "display error for retweet own tweet" do
      interface.same_user_error
      expect(Kernel).to receive(:puts).and_return(/You cannot retweet your own tweet/)
    end
  end
end
