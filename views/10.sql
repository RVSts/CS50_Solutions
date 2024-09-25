SELECT "id", "japanese_title", "english_title", "entropy" AS "The 3 Most Complex Woodblock Prints of Hokusai"
FROM "views"
WHERE "artist" = 'Hokusai'
ORDER BY "entropy" DESC
LIMIT 3;

