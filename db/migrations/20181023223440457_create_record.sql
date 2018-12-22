-- +micrate Up
CREATE TABLE records (
  id INTEGER NOT NULL PRIMARY KEY,
  device_id BIGINT NOT NULL,
  rh REAL NOT NULL,
  tc REAL NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX record_user_id_idx ON records (device_id);

-- +micrate Down
DROP TABLE IF EXISTS records;
