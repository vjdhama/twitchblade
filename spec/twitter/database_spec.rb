require "spec_helper"

module Twitter
  describe "DatabaseConnection" do

    it "will instantiate a PG::Connection object" do
      expect(DatabaseConnection.new("twitter_spec", "testing").conn).to be_a(PG::Connection)
    end 
  end
end