SELECT "50m", "latitude", "longitude" FROM "normals"
WHERE "latitude" LIKE '20%' AND "longitude" LIKE '55%' OR
"latitude" = '20%' LIKE "longitude" LIKE '75%' OR
"latitude" = '0%' LIKE "longitude" LIKE '55%' OR
"latitude" = '0%' LIKE "longitude" LIKE '75%';
