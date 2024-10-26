CREATE VIEW "message" AS
SELECT "sentence" AS "phrase" FROM "sentences"
WHERE substr("sentence", (
    SELECT substr("sentence", 14, 98) FROM "sentences"
),
4);

