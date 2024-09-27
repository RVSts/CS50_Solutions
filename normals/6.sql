SELECT "latitude", "50m", "longitude"
FROM "normals"
WHERE
    ("latitude" BETWEEN '0' AND '20') AND ("longitude" BETWEEN '55' AND '75');
