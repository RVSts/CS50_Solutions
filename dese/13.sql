SELECT "staff_evaluations"."exemplary", "staff_evaluations"."unsatisfactory", "districts"."name", "expenditures"."per_pupil_expenditure"
FROM "districts"
JOIN "staff_evaluations" ON "staff_evalutations"."district_id" = "districts"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "type"."districts" = 'Public School District'
AND "staff_evaluations"."exemplary" >(
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
AND "staff_evaluations"."unsatisfactory" >(
    AVG("unsatisfactory") FROM "staff_evaluations"
)
AND "expenditures"."per_pupil_expenditure">(
    AVG("per_pupil_expenditure") FROM "expenditures"
)
ORDER BY "unsatisfactory" DESC, "per_pupil_expenditure" DESC;
