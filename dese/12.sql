SELECT "name" FROM "districts"
WHERE "id" IN(
    SELECT "district_id" FROM "expenditures"
    WHERE "per_pupil_expenditure" > AVG("per_pupil_expenditure")
)
