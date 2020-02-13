# My-NBA-Calendar

Welcome to My NBA Calendar!

My NBA Calendar uses the API-NBA API that creates calendar events for your favorite team. You will be able to:

        1) view standings of all teams
        2) keep track of your favorite teams
        3) view stats of team leaders on your favorite teams
        4) view details about players on your favorite teams

## Login or Signup

Select `1. Login` to login using an existing username.
Select `2. Signup` to sign up with: 
            1) Username
            2) Full Name
            3) City

## Main Menu

Blueprint of My NBA Calendar:

```bash
├── `1.Favorite Teams`
│   ├── environment.rb # requires bundler and files
│   ├── run.rb # instantiates the SQLRunner class in the below file
│   └── sql_runner.rb # holds a class that handles executing your .sql files
├── `2.Add a Favorite Team`
│   ├── View list of all NBA teams # choose team by id associated with team
├── `3.Team Standings` # view standings by conference division (east/west)
├── `4.Schedule`
│   └──  View list of all your favorite teams # choose team
│        ├── Last 5 # score of last 5 games played 
│        ├── Next 5 # shows next 5 games scheduled 
│        └── Add Next 5 to my Google Calendar
├── `5. Stats`
│   └──  View list of all your favorite teams # choose team
│        ├── Team Leaders # shows team leaders over last 10 games 
│        └── Player Stats # shows player attributes 
├── `6.Delete a Favorite Team`
│   └──  View list of all your favorite teams # choose team to delete
└── `7.Exit`
```
