
# IAFLIX API

Welcome to the IAFLIX API! This API provides endpoints to manage movies.

## Frontend
To interact with the frontend and experience the full application, please visit the [GitHub repository for the frontend](https://github.com/jaferdaltro/iaflix).


## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [Docker](https://docs.docker.com/engine/install/)

### Installation

1. Clone the repository:

    ```bash
    git clone git@github.com:jaferdaltro/technical-test-jafer-daltro.git
    ```

2. Change into the project directory:

    ```bash
    cd technical-test-jafer-daltro
    ```

3. Install dependencies:

    ```bash
    bundle install
    ```

4. Set up the database:

    ```bash
    docker-compose up -d
    rails db:create db:migrate
    ```

5. Start the Rails server:

    ```bash
    rails server
    ```

The API will be available at `http://localhost:3000`.

## API Endpoints

### List Movies

- **Endpoint:** `GET /api/v1/movies`
- **Description:** Retrieve a list of all movies.

### Search Movies

- **Endpoint:** `GET /api/v1/movies/search`
- **Parameters:**
  - `title` (optional): Search term for movie titles.
- **Description:** Search for movies based on the provided title.

### Show Movie Details

- **Endpoint:** `GET /api/v1/movies/:id`
- **Parameters:**
  - `id`: Movie ID.
- **Description:** Retrieve details of a specific movie.

### Create a Movie

- **Endpoint:** `POST /api/v1/movies`
- **Parameters:**
  - `title`: Movie title.
  - `release_date`: Movie release date.
  - Other optional parameters: `runtime`, `genre`, `parental_rating`, `plot`.
- **Description:** Create a new movie.

### Delete a Movie

- **Endpoint:** `DELETE /api/v1/movies/:id`
- **Parameters:**
  - `id`: Movie ID.
- **Description:** Delete a specific movie.

### Rate a Movie

- **Endpoint:** `POST /api/v1/ratings/:movie_id`
- **Parameters:**
  - `movie_id`: Movie ID.
  - `grade`: Rate the movie.
- **Description:** Rate a specific movie.

## Testing

To run tests, use the following command:

```bash
rails rspec
```

## Observations

- The front end is in https://github.com/jaferdaltro/iaflix
