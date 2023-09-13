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
