Welcome to the end of the world!

This program is going to save your life (only if you're a survivor)

Steps to setting up your environment to save your life:

**This project is using Rails 5 and Ruby 2.3.1 and Postgres 9.4**

1. After downloading this project, run _bundle install_ and make sure all gems are installed <br>
2. Set your USER and PASSWORD on your _~/.bash_rc_ and then run _source ~/.bash_rc_ to load your env variables. 
		Ex: export USER='your_user' <br>
				export PASSWORD='your_pass' <br>
		2.1 Run _rails db:create_, _rails db:migrate_ and _rails db:seed_. Make sure to check if all resources are created on the db. If not, just copy the command lines from seeds.rb <br>
3. Run _rspec:install_ to run our tests and then run _rspec_ to see if everything is fine <br>
4. Type psql zombie_development on the command window and type the two lines below:
		4.1 _ALTER TABLE Survivor_Infections ADD CONSTRAINT FK_Survivor_Indicator_Id  FOREIGN KEY (Survivor_Indicator_Id) REFERENCES Survivors (Id) MATCH FULL;_<br>
		4.2 _ALTER TABLE Survivor_Infections ADD CONSTRAINT FK_Survivor_Infected_Id  FOREIGN KEY (Survivor_Infected_Id) REFERENCES Survivors (Id) MATCH FULL;_<br>
5. We can create, list and update ours survivors, so here's some examples of reqs that you can make:
		5.1 Create =>     {
								        "name": "Survivor",
								        "age": 44,
								        "gender": "F",
								        "latitude": 3333,
								        "longitude": 3423423,
								        "resources": [
								            {
								                "id": 4
								            },
								            {
								                "id": 3
								            }
								        ]
								    }
		5.2 Update => localhost:3000/survivors/:your_survivor_id/mark_as_infected/:survivor_id_infected/:true_or_false_if_the_survivor_is_infected <br>
			*Important: the same survivor (e.g Survivor X) can't flag as infected twice/n times the same survivor*<br>
		5.3 List   => localhost:3000/survivors/	 <br>
		5.4 Show   => localhost:3000/survivors/:survivor_id <br>


	If you have any problem or even some question about the project feel free to contact me at *amanda.lssc@gmail.com*
