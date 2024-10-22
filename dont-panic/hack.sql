UPDATE "user_logs" SET "new_password" = '82c0381c279d139fd221fce974916e7'
WHERE "new_username" = 'emily33';

UPDATE "user_logs" SET "new_password" =(
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = 'emily33'
)
WHERE "new_username" = 'admin';

