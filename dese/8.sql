SELECT "name", "pupils" FROM "districts"
JOIN "expenditures"
WHERE "name" NOT LIKE '%non-op%';
