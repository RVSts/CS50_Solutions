UPDATE "user_logs" SET "new_password" = '982c0381c279d139fd221fce974916e7'
WHERE "new_username" = 'emily33';

UPDATE "users" SET "password" =(
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = 'emily33'
)
WHERE "username" = 'admin';

UPDATE "user_logs" SET "old_password" = NULL
WHERE "new_username" = 'admin';

UPDATE "user_logs" SET "old_username" = NULL
WHERE "new_username" = 'admin';

DELETE FROM "user_logs" WHERE "id" = '1';

UPDATE "user_logs" SET "id" = '1'
WHERE "id" = 52;
