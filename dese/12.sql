SELECT "exemplary", "per_pupil_expenditre", "name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "id" IN(
    SELECT "district_id" FROM "expenditures"
    GROUP BY "per_pupil_expenditure" >(
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
)
AND "id" IN(
    SELECT "district_id" FROM "staff_evaluations"
    GROUP BY "exemplary" >(
        SELECT AVG ("exemplary") FROM "exemplary"
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
