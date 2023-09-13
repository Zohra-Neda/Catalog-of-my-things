CREATE DATABASE catalogue_of_things;

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
