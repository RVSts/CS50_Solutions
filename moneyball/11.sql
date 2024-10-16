SELECT "players"."first_name", "players"."last_name", ("salaries"."salary"/"performance"."H") AS "dollars per hit"
FROM p
