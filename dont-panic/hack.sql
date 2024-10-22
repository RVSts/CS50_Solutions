UPDATE "users" SET "password" =(
    SELECT "password" FROM "users"
    WHERE "username" = 'admin'
)
WHERE "username" = 'emily33';

UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

UPDATE "user_logs" SET "old_password" = NULL
WHERE "new_username" = 'admin';

UPDATE "user_logs" SET "old_username" = NULL
WHERE "new_username" = 'admin';

UPDATE "user_logs" SET "type" = 'insert'
WHERE "new_username" = 'admin';

SELECT * FROM "long_user_inserts";
