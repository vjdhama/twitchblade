require "spec_helper"

module Twitter
  describe "SearchUserInterface" do
    before(:each) { @interface = SearchUserInterface.new }

    it "should get input from STDIN" do
      expect(@interface.get_username).to eq("vijay")
    end
  end
end
