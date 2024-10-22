UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

INSERT INTO "user_logs"("new_username", "new_password", "old_password", "type")
VALUES('admin', '982c0381c279d139fd221fce974916e7', NULL, 'update');

DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "type" = 'insert' AND "new_password" IS NOT NULL;

DELETE FROM "user_logs"
WHERE "old_username" = 'admin' AND "type" = "update";

UPDATE "user_logs" SET "new_password" =(
    SELECT "new_password" FROM "user_logs"
    WHERE "new_username" = 'admin'
)
WHERE "new_username" = 'emily33';

UPDATE "user_logs" SET "id" = '1'
WHERE "new_username" = 'admin';
