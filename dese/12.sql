SELECT "exemplary", "per_pupil_expenditre", "name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "id" IN(
    SELECT "district_id" FROM "expenditures"
    WHERE "per_pupil_expenditure" > AVG("per_pupil_expenditure")
)
AND "id" IN(
    SELECT "district_id" FROM "staff_evaluations"
    WHERE "exemplary" > AVG("exemplary")
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
