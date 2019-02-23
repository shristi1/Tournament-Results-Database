## Synopsis
A Python module that uses the PostgreSQL database to keep track of players and matches in a Swiss-style game tournament.


## How Do I Use This?
To run this program locally on your computer:
	1. Make sure you have VirtualBox and Vagrant installed on your computer

	2. In your terminal navigate to the vagrant folder in which the files for the tournament program are written.

	3. Then, run vagrant up and vagrant ssh:
		1. vagrant up
		2. vagrant ssh

	4. CD into the tournament folder inside the vagrant directory
		1. cd /vagrant/tournament/

	5. Make sure the tournament database exists:
		1. psql
		2. CREATE DATABASE tournament;

	6. Then, import the SQL schemas:
		1. psql tournament < tournament.sql

	7. Run tournament_test.py:
		1. python tournament_test.py 

	You should see "Success! All tests pass!" at the bottom of the output.


## Contributors
Derived from Udacity's Full Stack Nanodegree under Section 5's project: Tournament Database.

