require "spec_helper"

module Twitter
  describe "TimelineModel" do
    
    def get_id(name)
      Connection.open.exec("select uid from users where username = '#{name}'").getvalue(0, 0)
    end
    
    before(:each) do 
      name = "vjdhama"
      password = "password"

      Connection.open.exec("insert into users (username, password) values ('#{name}', '#{password}')")

      user_id = get_id(name)

      Connection.open.exec("insert into tweets (content, user_id) values ('Go home', '#{user_id}')")
      Connection.open.exec("insert into tweets (content, user_id) values ('Call my phone', '#{user_id}')")

      @timeline_model = TimelineModel.new(name)
    end

    after(:each) do 
      Connection.open.exec("delete from tweets")
      Connection.open.exec("delete from users")
    end

    it "should get tweets based on logged in user" do
      expect(@timeline_model.get_tweets).to eq(['Go home', 'Call my phone'])
    end
  end
end

