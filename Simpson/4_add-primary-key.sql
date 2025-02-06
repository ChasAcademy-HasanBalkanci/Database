-- Migration 4: Add primary keys to all tables

-- characters table
CREATE TABLE characters_new (
    characters_id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL,
    gender VARCHAR
);

INSERT INTO characters_new (characters_id, name, normalized_name, gender)
SELECT characters_id, name, normalized_name, gender
FROM characters;

DROP TABLE characters;
ALTER TABLE characters_new RENAME TO characters;

-- locations table
CREATE TABLE locations_new (
    locations_id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL
);

INSERT INTO locations_new (locations_id, name, normalized_name)
SELECT locations_id, name, normalized_name
FROM locations;

DROP TABLE locations;
ALTER TABLE locations_new RENAME TO locations;

-- episodes table
CREATE TABLE episodes_new (
    episodes_id INTEGER PRIMARY KEY,
    image_url VARCHAR,
    imdb_rating FLOAT,
    imdb_votes FLOAT,
    number_in_season INTEGER NOT NULL,
    number_in_series INTEGER NOT NULL,
    original_air_date DATE NOT NULL,
    original_air_year INTEGER NOT NULL,
    production_code VARCHAR NOT NULL,
    season INTEGER NOT NULL,
    title VARCHAR NOT NULL,
    us_viewers_in_millions FLOAT,
    video_url VARCHAR,
    views FLOAT
);

INSERT INTO episodes_new (
    episodes_id, image_url, imdb_rating, imdb_votes, number_in_season, number_in_series,
    original_air_date, original_air_year, production_code, season, title,
    us_viewers_in_millions, video_url, views
)
SELECT
    episodes_id, image_url, imdb_rating, imdb_votes, number_in_season, number_in_series,
    original_air_date, original_air_year, production_code, season, title,
    us_viewers_in_millions, video_url, views
FROM episodes;

DROP TABLE episodes;
ALTER TABLE episodes_new RENAME TO episodes;

-- script_lines table
CREATE TABLE script_lines_new (
    script_lines_id INTEGER PRIMARY KEY,
    episode_id INTEGER NOT NULL,
    number INTEGER NOT NULL,
    raw_text VARCHAR NOT NULL,
    timestamp_in_ms VARCHAR NOT NULL,
    speaking_line VARCHAR NOT NULL,
    character_id VARCHAR,
    location_id INTEGER,
    raw_character_text VARCHAR,
    raw_location_text VARCHAR,
    spoken_words VARCHAR,
    normalized_text VARCHAR,
    word_count VARCHAR
);

INSERT INTO script_lines_new (
    script_lines_id, episode_id, number, raw_text, timestamp_in_ms, speaking_line,
    character_id, location_id, raw_character_text, raw_location_text,
    spoken_words, normalized_text, word_count
)
SELECT
    script_lines_id, episode_id, number, raw_text, timestamp_in_ms, speaking_line,
    character_id, location_id, raw_character_text, raw_location_text,
    spoken_words, normalized_text, word_count
FROM script_lines;

DROP TABLE script_lines;
ALTER TABLE script_lines_new RENAME TO script_lines;