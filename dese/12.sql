SELECT "exemplary", "per_pupil_expenditre", "districts"."name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "districts"."id" IN(
    SELECT "district_id" FROM "expenditures"
    GROUP BY "district_id"
    HAVING "per_pupil_expenditure" >(
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
)
AND "districts"."id" IN(
    SELECT "district_id" FROM "staff_evaluations"
    GROUP BY "district_id"
    HAVING "exemplary">(
        SELECT AVG ("exemplary") FROM "staff_evaluations"
    )
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
