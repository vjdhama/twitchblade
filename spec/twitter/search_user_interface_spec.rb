require "spec_helper"

module Twitter
  describe "SearchUserInterface" do
    before(:each) { @interface = SearchUserInterface.new }

    it "should get input from STDIN" do
      allow($stdin).to receive(:gets).and_return("vjdhama")
      expect(@interface.get_username).to eq("vjdhama")
    end

    it "should render header" do
      expect($stdin).to receive(:puts).twice
      @interface.render_header
    end
  end
end
