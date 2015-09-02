require "spec_helper"

module Twitter
  describe "User" do

    before(:each) do
      @user = User.new('vijay', '123')
      @invalid_user = User.new('aninda', '123')
      Connection.open.exec("insert into users (username, password) values ('vijay', '123')")
      Connection.open.exec("insert into users (username, password) values ('vjdhama', 'qza')")
    end

    after(:each) do
      Connection.open.exec("delete from users")
    end

    it "should insert username password tuple into users table if valid" do
      username = "vjdhama"
      @user.sign_up
      expect(Connection.open.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end

    it "should not insert username password tuple into users if username already present" do
      username = "vijay"
      @user.sign_up
      expect(Connection.open.exec("select username from users where username='#{username}'").ntuples).to eq(1)
    end

    it "should check if username is empty" do
      invalid_user = User.new("", "123")
      expect(invalid_user.valid_credentials?).to eq(false)
    end

    it "should check for empty passsword" do
      invalid_user = User.new("adw", "")
      expect(invalid_user.valid_credentials?).to eq(false)
    end

    it "should be valid on non empty input for both username and password" do
      expect(@user.valid_credentials?).to eq(true)
    end

    it "should check if valid login credentials are valid" do
      expect(@user.login).to eq("Logged In")
    end

    it "should check if invalid login credentials are not valid" do
      expect(@invalid_user.login).to eq("Invalid Credentials")
    end

    it "should logout the user" do
      @user.login
      expect(@user.logout).to eq("Logged Out") 
    end
  end
end
