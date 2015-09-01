require "spec_helper"

module Twitter
  describe "DatabaseConnectionPool" do
    
    before(:each){ @database_connection_pool = DatabaseConnectionPool.new }

    it "should return a database connection object" do
      expect(@database_connection_pool.get_db_connection).to be_a(PG::Connection)
    end


    it "should return error when number of connections exceed limit" do
      8.times {@database_connection_pool.get_db_connection}
      expect(@database_connection_pool.get_db_connection).to be(:db_connection_limit_reached)
    end
  end
end
