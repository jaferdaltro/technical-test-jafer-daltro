# About your test

For your technical test, fork this repository and then proceed as mentioned on the problem proposal below. Please feel free to reach out if you have any questions about the proposal!

# Problem proposal

Welcome to your technical test! Here's the problem you're trying to solve:

Your team was tasked to create a project from scratch that would list upcoming movie releases in Brazil. This project would have:
- An application with the backend code, written in Ruby on Rails
- An application with the frontend code, written in a JavaScript framework yet to be decided

## API

Your team started working on the API. After some time, you realized that the codebase might need some refactoring, and you were given the opportunity to help! We ask the following things from you:

- Analyze the code from the repository, compare it with the requirements listed below, and check for possible problems and improvement oportunities;
- Open one or more PRs with your suggestions. You can refactor the code, explaining the reasons for the changes on commit messages or whatever other means you think are more appropriate;
- You can also add new functionalities if you'd like!
- Lastly, we want to have some stats from the movies database. Add more movies to the database setup, and then create 5 database views with different stats that we can use to query the database. some ideas of questions that can be answered:
  - What’s the highest rated movie by genre and parental rating?
  - Which year had the most movies?
  - What’s the moving average of ratings over the past two months?
 
## UI

After our API is fixed, we can move on to the UI portion of the application. Since nothing for it has been written yet, it's your chance to do it however you want! We ask the following things from you:

- Create a frontend application that will interact with our API and display:
  - A list of movies
  - An individual page where we can learn more about each movie
- The App can be done with whatever frontend framework you prefer, but it needs to be separate from the API
- Bonus points if you can make components wherever possible 

# Proposed application requirements

list upcoming movie releases in Brazil.

- API written in Ruby on Rails;
  - All endpoints should return JSON unless specified.
- UI written in a JavaScript framework of your choice
  - It needs to get data from our API
- If you can, deploy your work somewhere so we can see it working
  - If you can't deploy it, provide a README / guide on how to get your app up and running

## API Endpoints:

### GET /movies
List all movies on a reverse chronological order.

Data from the movie that should be shown:
- title
- release_date
- genre
- runtime
- parental_rating
- plot
- average user ratings (from 1 to 5)

### GET /movies/:id
Return information about a particular movie.

### GET /movies/search?title=
Search all movies on the database given a searched term.

### POST /movies
Add a new movie.

### DELETE /movies/:id
Remove a movie.

### POST /ratings/:movie_id
Rate a movie.

WARNING: This is a fictional piece of work. No real codebases were harmed on the production of this test.
