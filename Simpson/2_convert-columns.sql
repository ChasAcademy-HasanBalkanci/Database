-- Migration 2: Convert FLOAT fields to INTEGER

-- Convert characters table
CREATE TABLE characters_new (
    id INTEGER NOT NULL,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL,
    gender VARCHAR
);

INSERT INTO characters_new (id, name, normalized_name, gender)
SELECT CAST(id AS INTEGER), name, normalized_name, gender
FROM characters;

DROP TABLE characters;
ALTER TABLE characters_new RENAME TO characters;

-- Convert locations table
CREATE TABLE locations_new (
    id INTEGER NOT NULL,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL
);

INSERT INTO locations_new (id, name, normalized_name)
SELECT CAST(id AS INTEGER), name, normalized_name
FROM locations;

DROP TABLE locations;
ALTER TABLE locations_new RENAME TO locations;

-- Convert episodes table
CREATE TABLE episodes_new (
    id INTEGER NOT NULL,
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
    id, image_url, imdb_rating, imdb_votes, number_in_season, number_in_series,
    original_air_date, original_air_year, production_code, season, title,
    us_viewers_in_millions, video_url, views
)
SELECT
    CAST(id AS INTEGER), image_url, imdb_rating, imdb_votes,
    CAST(number_in_season AS INTEGER), CAST(number_in_series AS INTEGER),
    original_air_date, CAST(original_air_year AS INTEGER), production_code,
    CAST(season AS INTEGER), title, us_viewers_in_millions, video_url, views
FROM episodes;

DROP TABLE episodes;
ALTER TABLE episodes_new RENAME TO episodes;

-- Convert script_lines table
CREATE TABLE script_lines_new (
    id INTEGER NOT NULL,
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
    id, episode_id, number, raw_text, timestamp_in_ms, speaking_line,
    character_id, location_id, raw_character_text, raw_location_text,
    spoken_words, normalized_text, word_count
)
SELECT
    CAST(id AS INTEGER), CAST(episode_id AS INTEGER), CAST(number AS INTEGER),
    raw_text, timestamp_in_ms, speaking_line, character_id,
    CAST(location_id AS INTEGER), raw_character_text, raw_location_text,
    spoken_words, normalized_text, word_count
FROM script_lines;

DROP TABLE script_lines;
ALTER TABLE script_lines_new RENAME TO script_lines;