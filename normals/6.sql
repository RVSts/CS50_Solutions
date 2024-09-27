SELECT "50m", "latitude", "longitude"
FROM "normals"
WHERE
    ("latitude" = '20' AND "longitude" = '55') OR
    ("latitude" = '20' AND "longitude" = '75') OR
    ("latitude" = '0' AND "longitude" = '55') OR
    ("latitude" = '0' AND "longitude" = '75');
