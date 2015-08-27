require "spec_helper"

module Twitter
  describe "User" do

    before(:all) do
      @connection = DatabaseConnection.new("twitter_spec")
    end

    before(:each) do
      @user = User.new("vijay", "123", @connection.conn)
      @connection.conn.exec("insert into users (username, password) values ('vijay', '123')")
      @connection.conn.exec("insert into users (username, password) values ('vjdhama', 'qza')")
    end

    after(:each) do
      @connection.conn.exec("delete from users")
    end

    it "should insert username password tuple into users table if valid" do
      username = "vjdhama"
      @user.sign_up
      expect(@connection.conn.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end

    it "should not insert username password tuple into users if username already present" do
      username = "vijay"
      @user.sign_up
      expect(@connection.conn.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end

    it "should check if username is empty" do
      invalid_user = User.new("", "123", @connection.conn)
      expect(invalid_user.valid?).to eq(false)
    end

    it "should check for empty passsword" do
      invalid_user = User.new("adw", "", @connection.conn)
      expect(invalid_user.valid?).to eq(false)
    end
  end
end