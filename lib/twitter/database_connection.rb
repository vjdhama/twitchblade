module Twitter
  #perform queries
  class DatabaseConnection
    def initialize
      @connection = PGconn.open(
        :dbname => ENV["dbname"], 
        :hostaddr => ENV["hostaddr"], 
        :user => ENV["user"], 
        :password => ENV["password"]
      )
    end

    def open
      @connection
    end

    def close
      @connection.close
    end
  end
  Connection = DatabaseConnection.new
end
