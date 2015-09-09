require "spec_helper"

module Twitter
  describe "SearchUserModel" do
    before(:each) do 
      
      username_1 = "vijay"
      password_1 = "test"

      username_2 = "vjdhama"
      password_2 = "pass"

      Connection.open.exec("insert into users (username, password) values ('#{username_2}', '#{password_2}')")

      @model_1 = SearchUserModel.new(username_1)
      @model_2 = SearchUserModel.new(username_2)
    end

    after(:each) { Connection.open.exec("delete from users") }

    it "should return false when user not present on system" do
      expect(@model_1.found_user?).to eq(false)
    end

    it "should return true when user is present on system" do
      expect(@model_2.found_user?).to eq(true)
    end
  end
end
