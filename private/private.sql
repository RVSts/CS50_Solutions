CREATE TABLE "triplets"(
    "sentence_id" INTEGER,
    "start_char" INTEGER,
    "lenght" INTEGER
);

INSERT INTO "triplets"("sentence_id", "start_char", "lenght") VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

CREATE VIEW "message" AS
SELECT substr("sentence", "start_char", "lenght") AS "phrase" FROM "triplets"
JOIN "sentences" ON "sentences"."id" = "triplets"."sentence_id";

