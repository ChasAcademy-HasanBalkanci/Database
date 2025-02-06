-- Migration 5: Add foreign keys where needed

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
    word_count VARCHAR,
    FOREIGN KEY (episode_id) REFERENCES episodes (episodes_id),
    FOREIGN KEY (character_id) REFERENCES characters (characters_id),
    FOREIGN KEY (location_id) REFERENCES locations (locations_id)
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