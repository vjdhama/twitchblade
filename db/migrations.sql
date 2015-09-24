CREATE USER twitter WITH PASSWORD 'twitter';
CREATE DATABASE twitter_staging OWNER twitter;

\connect twitter_staging

CREATE TABLE IF NOT EXISTS users 
(uid SERIAL PRIMARY KEY, username VARCHAR (50), password VARCHAR(50));

CREATE TABLE IF NOT EXISTS tweets
(tweet_id SERIAL PRIMARY KEY, content VARCHAR (140), 
  user_id INTEGER NOT NULL REFERENCES users(uid), retweet_id INTEGER default 0);

CREATE TABLE IF NOT EXISTS follow 
(follow_id SERIAL PRIMARY KEY, follower_id INTEGER NOT NULL REFERENCES users(uid),
  followed_id INTEGER NOT NULL REFERENCES users(uid));

ALTER TABLE users OWNER TO twitter;
ALTER TABLE tweets OWNER TO twitter;
ALTER TABLE follow OWNER TO twitter;