require "spec_helper"

module Twitter
  describe "UserSignup" do
    let(:connection) { DatabaseConnection.new("twitter_spec") }
    let(:user_sign_up_1) { UserSignUp.new("vijay", "123", connection.conn) }
    let(:user_sign_up_2) { UserSignUp.new("vjdhama", "123", connection.conn) }


    it "will check if user already exits" do
      expect(user_sign_up_1.username_available?).to eq(false)
    end
      
    it "will check if user not already present" do
      expect(user_sign_up_2.username_available?).to eq(true)
    end
  end
end