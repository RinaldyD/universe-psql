pg_dump -cC --inserts -U freecodecamp salon > salon.sql
psql -U postgres < salon.sql
