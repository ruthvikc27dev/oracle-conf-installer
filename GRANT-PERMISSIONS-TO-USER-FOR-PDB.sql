-- Enter pdb
ACCEPT pdb PROMPT 'Enter pluggable database name: ';

-- Enter username
ACCEPT username PROMPT 'Enter username: ';

-- To set session for pluggable DB
ALTER SESSION SET CONTAINER=&pdb;

-- GRANT PERMISSIONS TO USER
GRANT CONNECT TO &username;
GRANT CREATE VIEW TO &username;
GRANT CREATE TABLE TO &username;
GRANT CREATE TRIGGER TO &username;