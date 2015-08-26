module Twitter
  #perform queries
  class DatabaseConnection
    attr_reader :conn

    def initialize(dbname)
      @conn = PGconn.open(:dbname => dbname)
      @conn
    end
  end
end
