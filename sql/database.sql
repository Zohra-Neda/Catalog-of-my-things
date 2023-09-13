
CREATE TABLE IF NOT EXISTS IF NOT EXISTS "author" (
     "id" INT PRIMARY KEY,
    "first_name" varchar,
    "last_name" varchar
);

CREATE TABLE IF NOT EXISTS "game" (
     "id" INT PRIMARY KEY,
    "last_played_at" date,
    "multiplayer" varchar,
    "item_id" INT
);
ALTER TABLE "game" ADD FOREIGN KEY ("item_id") REFERENCES "item"("id");


CREATE TABLE IF NOT EXISTS "item" (
    "id" INT PRIMARY KEY,
    "genre" int4,
    "author" INT,
    "source" INT,
    "label" INT,
    "publisher_date" date,
    "archive" bool
);
ALTER TABLE "item" ADD FOREIGN KEY ("author") REFERENCES "author"("id");
