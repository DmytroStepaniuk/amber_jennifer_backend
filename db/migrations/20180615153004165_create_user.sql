-- +micrate Up
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS users;
