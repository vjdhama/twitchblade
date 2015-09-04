require "spec_helper"

module Twitter
  describe "CommandLineInterface" do
    
    before(:each){ @cli = CommandLineInterface.new }

    it "checks if, for user option 1 it gets 2 inputs" do
      allow($stdin).to receive(:gets).and_return("qaz", "123")
      @cli.process_banner_input(1)
    end
  end
end
