CREATE TABLE IF NOT EXISTS countries (
    "id" SERIAL PRIMARY KEY UNIQUE,
    "name" VARCHAR(40) NOT NULL UNIQUE,
    continent VARCHAR(40) NOT NULL,
    currency VARCHAR(5) NULL
);

CREATE TABLE IF NOT EXISTS categories (
    "id" SERIAL PRIMARY KEY UNIQUE,
    "name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS actors (
    "id" SERIAL PRIMARY KEY UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    height INT NULL,
    awards INT DEFAULT 0 NOT NULL CHECK(awards >= 0),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS productions_info (
    "id" SERIAL PRIMARY KEY UNIQUE,
    rating DECIMAL(4,2) NOT NULL,
    duration INT NOT NULL CHECK(duration > 0),
    budget DECIMAL(10,2) NULL,
    release_date DATE NOT NULL,
    has_subtitles BOOLEAN DEFAULT FALSE NOT NULL,
    synopsis TEXT NULL
);

CREATE TABLE IF NOT EXISTS productions (
    "id" SERIAL PRIMARY KEY UNIQUE,
    title VARCHAR(70) NOT NULL UNIQUE,
    country_id INT NOT NULL,
    production_info_id INT NOT NULL UNIQUE,
    FOREIGN KEY (country_id) REFERENCES countries("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (production_info_id) REFERENCES productions_info("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS productions_actors (
    production_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (production_id, actor_id),
    FOREIGN KEY (production_id) REFERENCES productions("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS categories_productions (
    category_id INT NOT NULL,
    production_id INT NOT NULL,
    PRIMARY KEY (category_id, production_id),
    FOREIGN KEY (category_id) REFERENCES categories("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (production_id) REFERENCES productions("id") ON DELETE CASCADE ON UPDATE CASCADE
);