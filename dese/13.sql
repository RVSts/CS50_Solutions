SELECT "staff_evaluations"."exemplar", "staff_evaluations"."unsatisfactory", "districts"."name", "expenditures"."per_pupil_expenditure"
FROM "districts"
JOIN "staff_evaluations" ON "staff_evalutations"."district_id" = "districts"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "type"."districts" = 
