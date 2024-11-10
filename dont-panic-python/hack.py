from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")
password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = 'oops!'
    WHERE "username" = 'admin';
    """
)
