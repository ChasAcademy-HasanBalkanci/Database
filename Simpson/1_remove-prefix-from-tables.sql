-- Migration 1: Remove simpsons_ prefix from all tables

ALTER TABLE simpsons_characters RENAME TO characters;
ALTER TABLE simpsons_locations RENAME TO locations;
ALTER TABLE simpsons_episodes RENAME TO episodes;
ALTER TABLE simpsons_script_lines RENAME TO script_lines;