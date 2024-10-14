SELECT "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary", "districts"."name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "districts"."type" = 'Public School District' AND "districts"."id" IN(
    SELECT "district_id" FROM "expenditures"
    WHERE "per_pupil_expenditure" >(
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
)
AND "districts"."id" IN(
    SELECT "district_id" FROM "staff_evaluations"
    WHERE "exemplary">(
        SELECT AVG ("exemplary") FROM "staff_evaluations"
    )
)
ORDER BY "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure" DESC;
