require "spec_helper"

module Twitter
  describe "UserSignup" do
    let(:connection) { DatabaseConnection.new("twitter_spec", "testing") }
    let(:user_sign_up) { UserSignUp.new("vijay", "123", connection.conn) }

    it "will check if user already exits" do
      expect(user_sign_up.username_available?).to eq(false)
    end
      
  end
end