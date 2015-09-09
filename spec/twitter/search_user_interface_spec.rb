require "spec_helper"

module Twitter
  describe "SearchUserInterface" do
    before(:each) { @interface = SearchUserInterface.new }

    it "should get input from STDIN" do
      allow(Kernel).to receive(:gets).and_return("vjdhama")
      expect(@interface.get_username).to eq("vjdhama")
    end

    it "should render header" do
      expect(Kernel).to receive(:puts).twice
      @interface.render_header
    end

    it "should render requirements" do
      expect(Kernel).to receive(:print)
      @interface.render_requirement
    end  

    it "should render success" do
      expect(Kernel).to receive(:puts)
      @interface.render_success
    end

    it "should render success" do
      expect(Kernel).to receive(:puts)
      @interface.render_failure
    end
  end
end
