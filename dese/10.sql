SELECT "per_pupil_expenditure", "name" FROM "districts"
WHERE "type" = 'Public School District'
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;
