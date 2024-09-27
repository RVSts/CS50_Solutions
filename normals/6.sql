SELECT "50m", "latitude", "longitude" FROM "normals"
WHERE ("latitude" LIKE '20%' AND "longitude" LIKE '55%') OR
("latitude" LIKE '20%' AND "longitude" LIKE '75%') OR
("latitude" LIKE '0%' AND "longitude" LIKE '55%') OR
("latitude" LIKE '0%' AND "longitude" LIKE '75%');
