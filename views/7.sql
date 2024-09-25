SELECT "brightness", ROW_NUMBER() OVER (ORDER BY "brightness" DESC)
FROM "views"
WHERE "artist" = 'Hiroshige';
