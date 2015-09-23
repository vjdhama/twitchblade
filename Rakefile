require "rspec/core/rake_task"
require "figaro"
require "pg"

RSpec::Core::RakeTask.new(:spec)

desc "Run the default task"
task :default => [:spec]

task :create_tables do
  Figaro.application = Figaro::Application.new(environment: ARGV.last, path: "config/application.yml")
  Figaro.load
  
  connection = PGconn.open(
    :dbname => ENV["dbname"], 
    :hostaddr => ENV["hostaddr"], 
    :user => ENV["user"], 
    :password => ENV["password"]
  )
  
  connection.exec("create table if not exists users (uid serial primary key, username varchar (50), password varchar(50));")
  connection.exec("create table if not exists tweets (tweet_id serial primary key, content varchar (140), user_id integer not null references users(uid), retweet_id integer default 0);")
  connection.exec("create table if not exists follow (follow_id serial primary key, follower_id integer not null references users(uid), followed_id integer not null references users(uid));") 
  connection.close
end
