require "spec_helper"

module Twitter
  describe "TweetModel" do

    def tweet_published?
      result = Connection.open.exec("select * from tweets where content = 'I am Batman!!'")
      result.ntuples > 0 ? true : false 
    end

    before(:each) do 
      @tweet_model = TweetModel.new("I am Batman!!")
      Connection.open.exec("insert into users (username, password) values ('vjdhama', '123')")
      LoggedIn.username = "vjdhama"
    end

    after(:each) do 
      Connection.open.exec("delete from tweets")
      Connection.open.exec("delete from users")
    end

    it "will persist tweet" do
      @tweet_model.save
      expect(tweet_published?).to eq(true)
    end
  end
end
