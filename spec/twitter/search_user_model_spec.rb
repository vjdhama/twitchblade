require "spec_helper"

module Twitter
  describe "SearchUserModel" do
    before(:each) do 
      
      username_1 = "vijay"
      password_1 = "test"

      username_2 = "vjdhama"
      password_2 = "pass"

      Connection.open.exec("insert into users (username, password) values ('#{username_1}', '#{password_1}')")

      @model = SearchUserModel.new(username_2)
    end

    after(:each) { Connection.open.exec("delete from users") }

    it "should return false when user not present on system" do
      expect(@model.found_user?).to eq(false)
    end
  end
end
