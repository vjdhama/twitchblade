module Twitter
  class DatabaseConnectionPool
    CONNECTION_LIMIT = 8
    
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