-- AFTER CREATING pluggable DB -

-- Enter pdb
ACCEPT pdb PROMPT 'Enter pluggable database name: ';

-- Enter host address
ACCEPT host PROMPT 'Enter host address (0.0.0.0 for localhost, VM...): ';

-- Enter port
ACCEPT port PROMPT 'Enter port: ';

STARTUP;
ALTER SESSION SET container=&pdb;
ALTER PLUGGABLE DATABASE &pdb open;
ALTER SYSTEM SET local_listener='(address=(protocol=tcp)(host=&host) (port=&port))' scope=spfile;
ALTER SYSTEM REGISTER;
ALTER PLUGGABLE DATABASE &pdb CLOSE IMMEDIATE;
ALTER PLUGGABLE DATABASE &pdb OPEN;


-- USE_SID_AS_SERVICE_ORCLCDB=on 

exit;