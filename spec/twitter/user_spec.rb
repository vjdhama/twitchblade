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

    it "should insert username password tuple into users table if valid" do
      username = "vjdhama"
      @user_sign_up_2.sign_up
      expect(@connection.conn.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end

    it "should not insert username password tuple into users if username already present" do
      username = "vijay"
      @user_sign_up_1.sign_up
      expect(@connection.conn.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end
  end
end