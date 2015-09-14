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
      seed_tables
    end

    def open
      @connection
    end

    def close
      @connection.close
    end

    private 
    
    def seed_tables
      @connection.exec("create table if not exists users (uid serial primary key, username varchar (50), password varchar(50));")
      @connection.exec("create table if not exists tweets (tweet_id serial primary key, content varchar (140), user_id integer not null references users(uid));")
    end
  end
  Connection = DatabaseConnection.new
end
