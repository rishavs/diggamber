-- +micrate Up
CREATE TABLE posts (
  id BIGSERIAL PRIMARY KEY,
  title TEXT,
  content TEXT,
  user_id BIGINT,
  link TEXT,
  likes INT,
  thumb TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_user_id_idx ON posts (user_id);

-- +micrate Down
DROP TABLE IF EXISTS posts;
