require "spec_helper"

module Twitter
  describe "RetweetModel" do

    def count
      Connection.open.exec("select count(*) from tweets").getvalue(0, 0).to_i
    end

    def get_user_id(name)
      Connection.open.exec("select uid from users where username = '#{name}'").getvalue(0, 0)
    end
    
    def get_tweet_id(name)
      Connection.open.exec("select tweet_id from tweets where content = $1", [name]).getvalue(0, 0)
    end
    
    before(:each) do 
      name = "vjdhama"
      password = "password"

      Connection.open.exec("begin")
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name, password])

      @user_id = get_user_id(name)

      Connection.open.exec("insert into tweets (content, user_id) values ('Go home', $1)", [@user_id])
      Connection.open.exec("insert into tweets (content, user_id) values ('Call my phone', $1)", [@user_id])

      Connection.open.exec("select count(*) from tweets").getvalue(0,0)
      LoggedIn.username = name

      @model = RetweetModel.new(get_tweet_id("Call my phone"))
    end

    after(:each) do
      Connection.open.exec("rollback") 
    end

    it "should save a new tweet" do
      count_1 = count
      @model.save
      expect(count).to be > (count_1)
    end

    it "should check if you can retweet" do
      expect(@model.can_retweet?).to be(false)
    end
  end
end
