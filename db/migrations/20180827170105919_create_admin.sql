-- +micrate Up
CREATE TABLE admins (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  encrypted_password VARCHAR NOT NULL,
  session_key VARCHAR UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS admins;
