-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Delete previous database then add and connect to new one
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

-- Player Table
CREATE TABLE players (
	id SERIAL primary key, 
	name text
);

-- Matches Table
CREATE TABLE matches (
	match_id SERIAL primary key,
	player INT REFERENCES players(id),
	opponent INT REFERENCES players(id),
  	outcome int
);

-- Count View: number of matches for each player
CREATE VIEW match_count AS
	SELECT players.id, count(matches.opponent) as count 
	FROM players LEFT JOIN matches
	ON players.id = matches.player
	GROUP BY players.id;

-- Wins View: number of wins for each player
CREATE VIEW wins AS
	SELECT players.id, count(matches.opponent) as count 
	FROM players LEFT JOIN (SELECT * FROM matches WHERE outcome > 0) as matches
	ON players.id = matches.player
	GROUP BY players.id;


-- Standings View: number of wins and matches for each player
CREATE VIEW standings AS 
	SELECT players.id,players.name,wins.count as wins,match_count.count as matches 
	FROM players,match_count,wins
	WHERE wins.id = match_count.id and players.id = wins.id;