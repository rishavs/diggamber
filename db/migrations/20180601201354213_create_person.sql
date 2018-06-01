-- +micrate Up
CREATE TABLE people (
  id BIGSERIAL PRIMARY KEY,
  name TEXT,
  thumb TEXT,
  flair TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS people;
