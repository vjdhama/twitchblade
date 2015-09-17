require "spec_helper"

module Twitter
  describe "StreamModel" do
    let(:model) { StreamModel.new("vjdhama") }
    
    def get_id(name)
      Connection.open.exec("select uid from users where username = '#{name}'").getvalue(0, 0)
    end

    before(:each) do
      name_1 = "vjdhama"
      password_1 = "pass"

      name_2 = "vijay"
      password_2 = "pass"

      name_3 = "scot"
      password_3 = "pass" 

      Connection.open.exec("begin")      
      
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name_1, password_1])
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name_2, password_2])      
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name_3, password_3])

      user_id_1 = get_id(name_1)
      user_id_2 = get_id(name_2)
      
      Connection.open.exec("insert into follow (follower_id, followed_id) values ($1, $2)", [user_id_1, user_id_2])

      Connection.open.exec("insert into tweets (content, user_id) values ('Go home', $1)", [user_id_1])
      Connection.open.exec("insert into tweets (content, user_id) values ('have fun', $1)", [user_id_1])
      Connection.open.exec("insert into tweets (content, user_id) values ('Call my phone', $1)", [user_id_2]) 
      Connection.open.exec("insert into tweets (content, user_id) values ('Rust is good', $1)", [user_id_2])    
    end

    after(:each) { Connection.open.exec("rollback") }

    it "should get all tweets from followers and logged in user" do
      expect(model.get_all_tweets.length).to eq(4)
    end
  end
end
