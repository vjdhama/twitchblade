module Twitter
  #perform queries
  class DatabaseConnection

    def initialize
      @connection = PGconn.open(:dbname => ENV["dbname"])
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
