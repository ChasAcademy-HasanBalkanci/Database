-- Migration 3: Rename id fields to include table name

-- characters table
ALTER TABLE characters RENAME COLUMN id TO characters_id;

-- locations table
ALTER TABLE locations RENAME COLUMN id TO locations_id;

-- episodes table
ALTER TABLE episodes RENAME COLUMN id TO episodes_id;

-- script_lines table
ALTER TABLE script_lines RENAME COLUMN id TO script_lines_id;