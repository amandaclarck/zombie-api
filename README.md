# Welcome to the end of the world!

## This program is going to save your life (only if you're a survivor)

## Steps to setting up your environment to save your life:

**This project is using Rails 5 and Ruby 2.3.1 and Postgres 9.4**
<br>*---------------------*
- After downloading this project, run _bundle install_ and make sure all gems are installed 
- Set your USER and PASSWORD on your _~/.bash_rc_ and then run _source ~/.bash_rc_ to load your env variables. 
		Ex: export USER='your_user' 
				export PASSWORD='your_pass' 
- Run _bundle exec bin/setup_ Make sure to check if all resources are created on the db. If not, just copy the command lines from seeds.rb 
- Type psql zombie_development on the command window and type the two lines below:
		- _ALTER TABLE Survivor_Infections ADD CONSTRAINT FK_Survivor_Indicator_Id  FOREIGN KEY (Survivor_Indicator_Id) REFERENCES Survivors (Id) MATCH FULL;_
		- _ALTER TABLE Survivor_Infections ADD CONSTRAINT FK_Survivor_Infected_Id  FOREIGN KEY (Survivor_Infected_Id) REFERENCES Survivors (Id) MATCH FULL;_

## Survivor
	- *Index:*
		```
			get localhost:3000/survivors
			Success: status 200
		

	- *Show:*
		
			get localhost:3000/survivors/:id
			Success: status 200
		

	- *Create:*
		 
			post localhost:3000/survivors

			{
		    "name": "Survivor",
		    "age": 48,
		    "gender": "U",
		    "latitude": 10,
		    "longitude": 202,
		    "resources": [1,2,3]
			}

			Success: status 201
			Fail: status 422
		
	- *Update:*
		
			put localhost:3000/survivors/:id

			{
		    "latitude": 10,
		    "longitude": 202,
		    "infected": true
			}

			Success: status 200
			Fail: status 422
		 

	- *Mark as infected:*
		
			post localhost:3000/mark_as_infected

			{
				"id":43,
				"survivor_indicator": 42,
				"infected": true,
				"latitude": 444444,
				"longitude": 3
			}

			Success: status 200
			Fail: status 422
		
	- *Exchange resources:*
		
			post localhost:3000/exchange_resources
			{
				"id": 42,
				"survivor_id_to_exchange": 43
			}

			Success: status 200
			Fail: status 422
		
## Resources
	- *Index:*
		
			get localhost:3000/resources
			Success: status 200
		
		- *Resources per survivor:*
		
			localhost:3000/resources_per_survivor
			Success: status 200
		

## Reports
	- *Index*
		
			localhost:3000/reports
	```
	If you have any problem or even some question about the project feel free to contact me at *amanda.lssc@gmail.com*
