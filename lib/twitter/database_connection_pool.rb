module Twitter
  class DatabaseConnectionPool
    
    CONNECTION_LIMIT = 8

    attr_reader :db_connections
    
    def initialize
      @db_connections = []
      @dbname = ENV["dbname"]
    end

    def get_db_connection
      if db_connection_available?
        @db_connections << PGconn.open(:dbname => @dbname)
        @db_connections.last
      else
        :db_connection_limit_reached
      end
    end

    def close_db_connection(db_connection)
      @db_connections.delete(db_connection)
      db_connection.close
    end

    private

    def db_connection_available?
      if @db_connections.length < CONNECTION_LIMIT
        true
      else
        false
      end
    end
  end
end