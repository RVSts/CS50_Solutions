CREATE VIEW "message" AS
SELECT "sentence" AS "phrase" FROM "sentences"
WHERE "id" IN(
    SELECT "id" FROM "sentences"
    WHERE "id" = '14' OR "id" = '114' OR 'id' 
)
