UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "type" = 'insert';

INSERT INTO "user_logs"("new_username", "new_password", "old_password", "type")
VALUES("admin", '982c0381c279d139fd221fce974916e7', NULL, 'update');

DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "old_password" IS NOT NULL;

INSERT INTO "user_logs"("new_username", "old_username", "new_password", "old_password", "type")
VALUES('admin', 'admin', (SELECT "new_password" FROM "user_logs" WHERE "new_username" = 'emily33'), '982c0381c279d139fd221fce974916e7', 'update');

DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "type" = 'update' AND "old_password" IS NULL;


