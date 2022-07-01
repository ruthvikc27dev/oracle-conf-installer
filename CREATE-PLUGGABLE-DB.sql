-- Set the session to ORCLCDB database
ALTER SESSION SET CONTAINER=cdb$root;

-- Enter pluggable database name to create
ACCEPT pdb PROMPT 'Enter pluggable database name: ';

-- Enter username & password
ACCEPT username PROMPT 'Enter username: ';
ACCEPT pass PROMPT 'Enter password: ';

-- ISSUE - 
-- SQL> ALTER DATABASE OPEN;
-- ALTER DATABASE OPEN
-- *
-- ERROR at line 1:
-- ORA-01157: cannot identify/lock data file 8 - see DBWR trace file
-- ORA-01110: data file 8: '/opt/oracle/oradata/ORCLCDB/pdbseed/undotbs01.dbf'
-- ALTER SESSION SET CONTAINER=PDB$SEED;
-- ALTER DATABASE DATAFILE '/opt/oracle/oradata/ORCLCDB/pdbseed/undotbs01.dbf' OFFLINE DROP;

-- Create pluggable DB with username and password
CREATE PLUGGABLE DATABASE &pdb ADMIN USER &username IDENTIFIED BY &pass FILE_NAME_CONVERT=('/opt/oracle/oradata/ORCLCDB/pdbseed','/opt/oracle/oradata/ORCLCDB/&pdb');

-- OPEN THE DATABASE
ALTER PLUGGABLE DATABASE &pdb OPEN;

-- CHECK existing PLUGGABLE DBs
show pdbs;

EXIT;