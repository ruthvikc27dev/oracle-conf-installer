-- Enter pluggable database name to drop
ACCEPT pdb PROMPT 'Enter pluggable database name to drop: ';

-- To set session for pluggable DB
ALTER SESSION SET CONTAINER=&pdb;

-- To shut down pluggable database
ALTER PLUGGABLE DATABASE &pdb CLOSE IMMEDIATE;

-- Set the session to ORCLCDB database
ALTER SESSION SET CONTAINER=cdb$root;

-- Unplugging the database which is required to delete.
-- Put a valid path
DEFINE xmlfile = '.xml';
ALTER PLUGGABLE DATABASE &pdb UNPLUG INTO '/opt/oracle/product/19c/dbhome_1/orabackup/&pdb&xmlfile';

-- Close all the INSTANCES
ALTER PLUGGABLE DATABASE &pdb CLOSE instances=all;

-- DROP the DATABASE without saving files
DROP PLUGGABLE DATABASE &pdb;

-- DROP the DATABASE with saving files
-- DROP PLUGGABLE DATABASE &pdb KEEP DATAFILES;

EXIT;