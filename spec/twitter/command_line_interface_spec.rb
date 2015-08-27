require "spec_helper"

module Twitter
  describe "CommandLineInterface" do
    it 'check for invalid input' do
      cli = CommandLineInterface.new
      expect{ cli.process(3) }.to output(/Invalid option/).to_stdout
    end
  end
end
