require "spec_helper"

module Twitter
  describe "FollowModel" do
    let(:model) { FollowModel.new("vjdhama", "vijay") }

    before(:each) do 
      name_1 = "vjdhama"
      password_1 = "pass"

      name_2 = "vijay"
      password_2 = "pass" 

      Connection.open.exec("begin")      
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name_1, password_1])
      Connection.open.exec("insert into users (username, password) values ($1, $2)", [name_2, password_2])
    end

    after(:each) { Connection.open.exec("rollback")}

    def entries_count
      result = Connection.open.exec("select * from follow")
      result.ntuples
    end

    it "should save the follower and followed" do
      initial_number_of_entries = entries_count
      model.save
      final_number_of_entries = entries_count
      expect(final_number_of_entries).to be > initial_number_of_entries
    end
  end
end
