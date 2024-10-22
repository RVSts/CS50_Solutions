-- 1. Atualiza a senha do admin
UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- 2. Insere um log da alteração de senha do admin
INSERT INTO "user_logs" ("new_username", "new_password", "old_password", "type")
VALUES ('admin', '982c0381c279d139fd221fce974916e7', (SELECT "password" FROM "users" WHERE "username" = 'admin'), 'update');

-- 3. Adiciona um log falso que simula a mudança de senha do admin para a senha de emily33
INSERT INTO "user_logs" ("new_username", "new_password", "old_password", "type")
VALUES ('admin', (SELECT "password" FROM "users" WHERE "username" = 'emily33'), NULL, 'insert');

-- 4. Limpa logs antigos do admin, se necessário
DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "type" = 'insert' AND "new_password" != '982c0381c279d139fd221fce974916e7';

-- 5. Atualiza logs para que pareça que a senha do admin foi mudada para a senha de emily33
UPDATE "user_logs"
SET "new_password" = (SELECT "password" FROM "users" WHERE "username" = 'emily33')
WHERE "new_username" = 'admin' AND "type" = 'update';

DELETE FROM "user_logs" WHERE "old_username" IS NULL;
