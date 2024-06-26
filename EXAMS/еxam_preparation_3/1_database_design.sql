CREATE TABLE IF NOT EXISTS categories(
    "id" SERIAL PRIMARY KEY UNIQUE,
    "name" VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses(
    "id" SERIAL PRIMARY KEY UNIQUE,
    street_name VARCHAR(100) NOT NULL,
    street_number INT CHECK (street_number > 0) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip_code INT CHECK (zip_code > 0) NOT NULL
);

CREATE TABLE IF NOT EXISTS publishers(
    "id" SERIAL PRIMARY KEY UNIQUE,
    "name" VARCHAR(30) NOT NULL,
    address_id INT REFERENCES addresses(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    website VARCHAR(40),
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS players_ranges(
    "id" SERIAL PRIMARY KEY UNIQUE,
    min_players INT CHECK(min_players > 0) NOT NULL,
    max_players INT CHECK(max_players > 0) NOT NULL
);

CREATE TABLE IF NOT EXISTS creators(
    "id" SERIAL PRIMARY KEY UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS board_games(
    "id" SERIAL PRIMARY KEY UNIQUE,
    "name" VARCHAR(30) NOT NULL,
    release_year INT CHECK(release_year > 0) NOT NULL,
    rating NUMERIC(2) NOT NULL,
    category_id INT REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    players_range_id INT REFERENCES players_ranges(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS creators_board_games(
    creator_id INT REFERENCES creators(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    board_game_id INT REFERENCES board_games(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);