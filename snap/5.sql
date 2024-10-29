SELECT COUNT("user_id") FROM "friends"
WHERE "friend_id" IN(
    SELECT "id" FROM "users"
    WHERE "username" = 'lovelytrust487' OR "username" = 'exceptionalinspiration482'
);
