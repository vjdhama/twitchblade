require "spec_helper"

module Twitter
  describe "User" do

    before(:all) do
      @connection = DatabaseConnection.new("twitter_spec")
    end

    before(:each) do
      @user_sign_up_1 = User.new("vijay", "123", @connection.conn) 
      @user_sign_up_2 = User.new("aninda", "123", @connection.conn)
      @connection.conn.exec("insert into users (username, password) values ('vijay', '123')")
      @connection.conn.exec("insert into users (username, password) values ('vjdhama', 'qza')")
    end

    after(:each) do
      @connection.conn.exec("delete from users")
    end

    context "#username_available?" do
      it "will check if user already exits" do
        expect(@user_sign_up_1.username_available?).to eq(false)
      end
        
      it "will check if user not already present" do
        expect(@user_sign_up_2.username_available?).to eq(true)
      end
    end

    it "should insert username password tuple into users table if valid" do
      username = "vjdhama"
      @user_sign_up_2.sign_up
      expect(@connection.conn.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end
  end
end