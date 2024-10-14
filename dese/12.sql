SELECT
    "districts"."name",
    "expenditures"."per_pupil_expenditure",
    (SELECT
         COUNT(*) FILTER (WHERE "rating" = 'exemplary') * 100.0 / COUNT(*)
     FROM
         "staff_evaluations"
     WHERE
         "district_id" = "districts"."id") AS "percentage_exemplary"
FROM
    "districts"
JOIN
    "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE
    "expenditures"."per_pupil_expenditure" > (
        SELECT AVG("per_pupil_expenditure")
        FROM "expenditures"
    )
AND
    (SELECT
         COUNT(*) FILTER (WHERE "rating" = 'exemplary') * 100.0 / COUNT(*)
     FROM
         "staff_evaluations"
     WHERE
         "district_id" = "districts"."id") > (
        SELECT AVG(
            (SELECT COUNT(*) FILTER (WHERE "rating" = 'exemplary') * 100.0 / COUNT(*)
             FROM "staff_evaluations"
             WHERE "district_id" = "staff_evaluations"."district_id")
        )
        FROM "staff_evaluations"
    )
ORDER BY
    "percentage_exemplary" DESC,
    "expenditures"."per_pupil_expenditure" DESC;
