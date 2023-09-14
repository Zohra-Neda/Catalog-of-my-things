CREATE DATABASE catalogue_of_my_things;

CREATE TABLE IF NOT EXISTS "genre" (
    "id" INT PRIMARY KEY,
    "name" varchar,
    "item_id" INT
);

CREATE TABLE IF NOT EXISTS "musicAlbum" (
    "id" INT PRIMARY KEY,
    "on_spotify" bool,
    "item_id" INT
);
ALTER TABLE "musicAlbum" ADD FOREIGN KEY ("item_id") REFERENCES "item"("id");


CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  label_id INT REFERENCES labels(id),
  author_ID INT REFERENCES authors(id),
  genre_ID INT REFERENCES genre(id),
  can_be_archived BOOLEAN,
  cover_state VARCHAR(250),
  publisher VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE labels (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 color VARCHAR(255),
 title VARCHAR(255),
 items TEXT
 []
);


CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  played_at_date DATE,
  author_id INT NOT NULL,
  genre_id INT NOT NULL,
  label_id INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);