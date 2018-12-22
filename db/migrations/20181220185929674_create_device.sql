-- +micrate Up
CREATE TABLE devices (
  id INTEGER NOT NULL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  name VARCHAR NOT NULL,
  uuid VARCHAR NOT NULL UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX device_user_id_idx ON devices (user_id);

-- +micrate Down
DROP TABLE IF EXISTS devices;
