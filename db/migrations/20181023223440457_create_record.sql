-- +micrate Up
CREATE TABLE records (
  id INTEGER NOT NULL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  amount REAL NOT NULL,
  period VARCHAR NOT NULL,
  unit VARCHAR NOT NULL,
  start_date TIMESTAMP NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX record_user_id_idx ON records (user_id);

-- +micrate Down
DROP TABLE IF EXISTS records;
