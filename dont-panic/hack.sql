UPDATE "user_logs" SET "new_password" = '82c0381c279d139fd221fce974916e7'
WHERE "new_username" = 'emily33';

UPDATE "users" SET "password" =(
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = 'emily33'
)
WHERE "username" = 'admin';

